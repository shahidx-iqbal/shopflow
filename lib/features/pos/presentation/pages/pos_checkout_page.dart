import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/layout/page_responsive_body.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/utils/formatters.dart';
import '../utils/pos_receipt_actions.dart';
import '../../../../core/widgets/dialogs/app_dialog.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/dialogs/confirm_dialog.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../domain/entities/sale_enums.dart';
import '../../domain/entities/sale_entity.dart';
import '../bloc/pos_bloc.dart';
import '../bloc/pos_event.dart';
import '../bloc/pos_state.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/cart_summary_bar.dart';
import '../widgets/customer_picker_sheet.dart';
import '../widgets/payment_type_selector.dart';
import '../widgets/pos_product_picker.dart';
import '../widgets/pos_quantity_sheet.dart';

/// POS checkout screen — product grid, cart, sale type, and confirm flow.
class PosCheckoutPage extends StatefulWidget {
  const PosCheckoutPage({super.key});

  @override
  State<PosCheckoutPage> createState() => _PosCheckoutPageState();
}

class _PosCheckoutPageState extends State<PosCheckoutPage>
    with SingleTickerProviderStateMixin {
  final _cashController = TextEditingController();
  TabController? _tabController;

  @override
  void dispose() {
    _cashController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  double _parseCashInput(String raw) {
    final normalized = raw.trim().replaceAll(',', '');
    return double.tryParse(normalized) ?? 0;
  }

  void _syncCashController(double cashReceived) {
    if (cashReceived <= 0) {
      if (_cashController.text.isNotEmpty) {
        _cashController.clear();
      }
      return;
    }
    final text = cashReceived == cashReceived.roundToDouble()
        ? cashReceived.round().toString()
        : cashReceived.toString();
    if (_cashController.text != text) {
      _cashController.text = text;
    }
  }

  String _localizeError(AppLocalizations l10n, String? code) {
    switch (code) {
      case 'cart_empty':
        return l10n.posCartEmpty;
      case 'customer_required':
        return l10n.posCustomerRequired;
      case 'cash_required':
        return l10n.posCashRequiredMessage;
      case 'insufficient_cash':
        return l10n.posInsufficientCashMessage;
      case 'product_not_found':
        return l10n.barcodeNotFound;
      case 'insufficient_stock':
        return l10n.dialogStockLowTitle;
      default:
        return l10n.msgSomethingWentWrong;
    }
  }

  Future<void> _showPosErrorDialog(
    BuildContext context,
    PosState state,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final code = state.message;
    if (code == null) return;

    switch (code) {
      case 'cash_required':
        await AppDialog.showConfirm(
          context: context,
          title: l10n.posCashRequiredTitle,
          message: l10n.posCashRequiredMessage,
          confirmLabel: l10n.dialogDismiss,
          cancelLabel: l10n.btnCancel,
        );
      case 'insufficient_cash':
        final switchToLedger = await AppDialog.showConfirm(
          context: context,
          title: l10n.posInsufficientCashTitle,
          message: l10n.posInsufficientCashMessage,
          confirmLabel: l10n.posSwitchToLedgerSale,
          cancelLabel: l10n.dialogDismiss,
        );
        if (switchToLedger == true && context.mounted) {
          context.read<PosBloc>().add(
                const PosSelectSaleTypeEvent(saleType: SaleType.ledger),
              );
          if (state.selectedCustomer == null) {
            await _pickCustomer(context);
          }
        }
      case 'insufficient_stock':
        await AppDialog.showStockWarning(
          context: context,
          title: l10n.dialogStockLowTitle,
          confirmLabel: l10n.dialogDismiss,
          items: [
            state.errorDetail ?? l10n.msgSomethingWentWrong,
          ],
        );
      case 'customer_required':
        final selectCustomer = await AppDialog.showConfirm(
          context: context,
          title: l10n.posCustomerRequiredTitle,
          message: l10n.posCustomerRequired,
          confirmLabel: l10n.posSelectCustomer,
          cancelLabel: l10n.btnCancel,
        );
        if (selectCustomer == true && context.mounted) {
          await _pickCustomer(context);
        }
      default:
        await AppDialog.showConfirm(
          context: context,
          title: l10n.msgSomethingWentWrong,
          message: state.errorDetail ?? _localizeError(l10n, code),
          confirmLabel: l10n.dialogDismiss,
          cancelLabel: l10n.btnCancel,
        );
    }

    if (context.mounted) {
      context.read<PosBloc>().add(const PosAcknowledgeErrorEvent());
    }
  }

  Future<void> _pickCustomer(BuildContext context) async {
    final customer = await CustomerPickerSheet.show(context);
    if (customer != null && context.mounted) {
      context.read<PosBloc>().add(PosSelectCustomerEvent(customer: customer));
    }
  }

  Future<void> _showPaymentSuccessDialog(
    BuildContext context,
    SaleEntity sale,
  ) async {
    final l10n = AppLocalizations.of(context)!;

    await AppDialog.showPaymentSuccess(
      context: context,
      title: l10n.dialogPaymentSuccessTitle,
      amount: Formatters.currency(sale.total),
      primaryLabel: l10n.posViewReceipt,
      secondaryLabel: l10n.posShareWhatsApp,
      onPrimary: () => PosReceiptActions.viewReceipt(context, sale),
      onSecondary: () => PosReceiptActions.shareOnWhatsApp(context, sale),
    );

    if (context.mounted) {
      context.read<PosBloc>().add(const PosAcknowledgeSuccessEvent());
    }
  }

  String _localizeWarning(AppLocalizations l10n, String? code) {
    switch (code) {
      case 'out_of_stock':
        return l10n.posOutOfStock;
      case 'stock_capped':
        return l10n.posStockCapped;
      default:
        return code ?? l10n.msgSomethingWentWrong;
    }
  }

  Future<void> _showResumeDraftDialog(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final resume = await ConfirmDialog.show(
      context: context,
      title: l10n.posResumeDraftTitle,
      message: l10n.posResumeDraftMessage,
      confirmLabel: l10n.posResumeDraftConfirm,
      cancelLabel: l10n.posResumeDraftDiscard,
    );

    if (!context.mounted) return;

    if (resume == true) {
      context.read<PosBloc>().add(const PosResumeDraftEvent());
    } else {
      context.read<PosBloc>().add(const PosDiscardDraftEvent());
    }
  }

  Future<void> _confirmClearCart(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await ConfirmDialog.show(
      context: context,
      title: l10n.posClearCartTitle,
      message: l10n.posClearCartMessage,
      confirmLabel: l10n.posClearCartConfirm,
      cancelLabel: l10n.btnCancel,
      isDestructive: true,
    );
    if (confirmed == true && context.mounted) {
      context.read<PosBloc>().add(const PosClearCartEvent());
    }
  }

  Future<void> _showQuantitySheet(
    BuildContext context,
    PosState state,
  ) async {
    final product = state.pendingQuantityProduct;
    if (product == null) return;

    final event = await PosQuantitySheet.show(
      context,
      product: product,
      initialQuantity: state.pendingQuantityPrefill,
    );

    if (!context.mounted) return;
    context.read<PosBloc>().add(const PosDismissQuantitySheetEvent());

    if (event != null) {
      context.read<PosBloc>().add(event);
    }
  }

  Future<void> _showBarcodeNotFoundDialog(
    BuildContext context,
    String barcode,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final create = await AppDialog.showProductNotFound(
      context: context,
      title: l10n.dialogProductNotFoundTitle,
      message: l10n.dialogProductNotFoundMessage(barcode),
      dismissLabel: l10n.dialogDismiss,
      createLabel: l10n.dialogCreateProduct,
    );

    if (create == true && context.mounted) {
      context.push(RouteNames.addProduct, extra: barcode);
    }

    if (context.mounted) {
      context.read<PosBloc>().add(const PosAcknowledgeScanNotFoundEvent());
    }
  }

  void _showOutOfStockInline(BuildContext context, ProductEntity product) {
    final l10n = AppLocalizations.of(context)!;
    AppSnackbar.showError(
      context,
      '${product.name}: ${l10n.posOutOfStock}',
    );
    context.read<PosBloc>().add(const PosAcknowledgeOutOfStockEvent());
  }

  Widget _buildCartPanel(BuildContext context, PosState state, {bool scrollable = true}) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

    final cartList = state.cartItems.isEmpty
        ? EmptyStateWidget(
            icon: LucideIcons.shoppingCart,
            iconBackgroundColor: AppColors.border,
            iconColor: AppColors.neutral,
            title: l10n.posCartEmpty,
            subtitle: l10n.posCartEmptyHint,
          )
        : ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop
                  ? AppDimensions.space24
                  : AppDimensions.pagePadding,
            ),
            itemCount: state.cartItems.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final item = state.cartItems[i];
              return CartItemTile(
                item: item,
                onIncrement: () => context.read<PosBloc>().add(
                      PosUpdateQuantityEvent(
                        productId: item.productId,
                        quantity: item.quantity + 1,
                      ),
                    ),
                onDecrement: () => context.read<PosBloc>().add(
                      PosUpdateQuantityEvent(
                        productId: item.productId,
                        quantity: item.quantity - 1,
                      ),
                    ),
                onRemove: () => context.read<PosBloc>().add(
                      PosRemoveFromCartEvent(productId: item.productId),
                    ),
              );
            },
          );

    final panel = Column(
      children: [
        PageResponsiveBody(
          maxWidth: 960,
          child: PaymentTypeSelector(
            selected: state.saleType,
            ledgerLocked: state.isLedgerSaleLocked,
            onChanged: (type) {
              context.read<PosBloc>().add(
                    PosSelectSaleTypeEvent(saleType: type),
                  );
              if (type == SaleType.ledger &&
                  state.selectedCustomer == null) {
                _pickCustomer(context);
              }
            },
          ),
        ),
        if (state.selectedCustomer != null ||
            state.saleType == SaleType.ledger)
          PageResponsiveBody(
            maxWidth: 960,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                state.selectedCustomer?.name ?? l10n.posSelectCustomer,
              ),
              subtitle: state.selectedCustomer != null &&
                      state.selectedCustomer!.balance > 0
                  ? Text(
                      '${l10n.posOutstandingBalance}: '
                      '${Formatters.currency(state.selectedCustomer!.balance)}',
                    )
                  : null,
              trailing: Text(l10n.posChangeCustomer),
              onTap: () => _pickCustomer(context),
            ),
          ),
        if (state.cartItems.isNotEmpty)
          PageResponsiveBody(
            maxWidth: 960,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => _confirmClearCart(context),
                icon: const Icon(LucideIcons.trash2, size: 18),
                label: Text(l10n.posClearCart),
              ),
            ),
          ),
        if (state.saleType == SaleType.ledger)
          PageResponsiveBody(
            maxWidth: 960,
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.posPartialPayment),
              value: state.isPartialPayment,
              onChanged: (v) => context.read<PosBloc>().add(
                    PosTogglePartialPaymentEvent(enabled: v),
                  ),
            ),
          ),
        if (state.saleType == SaleType.cash ||
            (state.saleType == SaleType.ledger && state.isPartialPayment))
          PageResponsiveBody(
            maxWidth: 960,
            child: TextField(
              controller: _cashController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: l10n.posCashReceived,
                border: const OutlineInputBorder(),
              ),
              onChanged: (v) {
                context.read<PosBloc>().add(
                      PosUpdateCashReceivedEvent(
                        amount: _parseCashInput(v),
                      ),
                    );
              },
              onEditingComplete: () {
                context.read<PosBloc>().add(
                      PosUpdateCashReceivedEvent(
                        amount: _parseCashInput(_cashController.text),
                      ),
                    );
              },
            ),
          ),
        Expanded(child: scrollable ? cartList : cartList),
        CartSummaryBar(
          subtotal: state.itemsSubtotal,
          cartDiscount: state.cartDiscount,
          tax: state.tax,
          total: state.total,
          changeDue: state.changeDue,
          ledgerRemainder: state.ledgerRemainder,
          isLoading: state.status == PosStatus.submitting,
          enabled: state.canConfirmSale,
          onConfirm: () {
            final cash = _parseCashInput(_cashController.text);
            context.read<PosBloc>().add(
                  PosConfirmSaleEvent(cashReceived: cash),
                );
          },
        ),
      ],
    );

    if (isDesktop) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border(
            left: BorderSide(color: AppColors.border.withValues(alpha: 0.6)),
          ),
        ),
        child: panel,
      );
    }
    return panel;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => getIt<PosBloc>()..add(const PosInitializeEvent()),
      child: BlocConsumer<PosBloc, PosState>(
        listenWhen: (prev, next) {
          if (!prev.showResumeDraftPrompt && next.showResumeDraftPrompt) {
            return true;
          }
          if (prev.status != PosStatus.success &&
              next.status == PosStatus.success &&
              next.lastCompletedSale != null) {
            return true;
          }
          if (prev.status != PosStatus.error &&
              next.status == PosStatus.error &&
              next.message != null) {
            return true;
          }
          if (prev.cashReceived != next.cashReceived) {
            return true;
          }
          if (prev.scannedBarcodeNotFound != next.scannedBarcodeNotFound &&
              next.scannedBarcodeNotFound != null) {
            return true;
          }
          if (prev.outOfStockProduct != next.outOfStockProduct &&
              next.outOfStockProduct != null) {
            return true;
          }
          return prev.status != next.status ||
              prev.warningMessage != next.warningMessage ||
              prev.pendingQuantityProduct != next.pendingQuantityProduct ||
              prev.cartItems.length != next.cartItems.length;
        },
        listener: (context, state) {
          if (state.showResumeDraftPrompt) {
            _showResumeDraftDialog(context);
          }

          _syncCashController(state.cashReceived);

          if (state.status == PosStatus.success &&
              state.lastCompletedSale != null) {
            _showPaymentSuccessDialog(context, state.lastCompletedSale!);
          } else if (state.status == PosStatus.error && state.message != null) {
            _showPosErrorDialog(context, state);
          }

          if (state.warningMessage != null) {
            AppSnackbar.showError(
              context,
              _localizeWarning(l10n, state.warningMessage),
            );
          }

          if (state.pendingQuantityProduct != null) {
            _showQuantitySheet(context, state);
          }

          if (state.scannedBarcodeNotFound != null) {
            _showBarcodeNotFoundDialog(
              context,
              state.scannedBarcodeNotFound!,
            );
          }

          if (state.outOfStockProduct != null) {
            _showOutOfStockInline(context, state.outOfStockProduct!);
          }
        },
        builder: (context, state) {
          final isDesktop =
              MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

          if (!isDesktop && _tabController == null) {
            _tabController = TabController(length: 2, vsync: this);
          }

          final body = isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Expanded(flex: 3, child: PosProductPicker()),
                    Expanded(
                      flex: 2,
                      child: _buildCartPanel(context, state),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Material(
                      color: AppColors.surface,
                      child: TabBar(
                        controller: _tabController,
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.neutral,
                        indicatorColor: AppColors.primary,
                        tabs: [
                          Tab(text: l10n.posTabProducts),
                          Tab(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(l10n.posTabCart),
                                if (state.cartItems.isNotEmpty) ...[
                                  const SizedBox(width: AppDimensions.space8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppDimensions.space8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(
                                        AppDimensions.radiusFull,
                                      ),
                                    ),
                                    child: Text(
                                      '${state.cartItems.length}',
                                      style: AppTextStyles.labelSmall.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          const PosProductPicker(),
                          _buildCartPanel(context, state),
                        ],
                      ),
                    ),
                  ],
                );

          return Scaffold(
            appBar: AppTopBar(
              title: l10n.posTitle,
              showBackButton: true,
            ),
            body: body,
          );
        },
      ),
    );
  }
}
