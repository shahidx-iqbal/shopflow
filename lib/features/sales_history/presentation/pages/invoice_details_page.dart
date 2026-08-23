import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/receipt/receipt_actions.dart';
import '../../../../core/receipt/receipt_template_builder.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/buttons/outlined_button_widget.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/sales_history_bloc.dart';
import '../bloc/sales_history_event.dart';
import '../bloc/sales_history_state.dart';

/// Invoice detail — formatted receipt matching Receipt Settings, with share/download.
class InvoiceDetailsPage extends StatefulWidget {
  const InvoiceDetailsPage({required this.saleId, super.key});

  final String saleId;

  @override
  State<InvoiceDetailsPage> createState() => _InvoiceDetailsPageState();
}

class _InvoiceDetailsPageState extends State<InvoiceDetailsPage> {
  final _receiptKey = GlobalKey();
  bool _actionBusy = false;

  Future<void> _shareReceipt(
    BuildContext blocContext,
    AppLocalizations l10n,
  ) async {
    final sale = blocContext.read<SalesHistoryBloc>().state.selectedSale;
    if (sale == null || _actionBusy) return;

    setState(() => _actionBusy = true);
    try {
      await ReceiptActions.shareText(sale, l10n);
    } finally {
      if (mounted) setState(() => _actionBusy = false);
    }
  }

  Future<void> _downloadReceipt(
    BuildContext blocContext,
    AppLocalizations l10n,
  ) async {
    final sale = blocContext.read<SalesHistoryBloc>().state.selectedSale;
    if (sale == null || _actionBusy) return;

    setState(() => _actionBusy = true);
    try {
      await ReceiptActions.downloadImage(
        receiptKey: _receiptKey,
        fileName: 'receipt-${sale.displayInvoiceNumber}',
      );
    } catch (_) {
      if (mounted) {
        AppSnackbar.showError(context, l10n.msgSomethingWentWrong);
      }
    } finally {
      if (mounted) setState(() => _actionBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => getIt<SalesHistoryBloc>()
        ..add(SalesHistoryLoadDetailsEvent(id: widget.saleId)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppTopBar(
          title: l10n.invoiceDetailsTitle,
          showBackButton: true,
        ),
        body: BlocBuilder<SalesHistoryBloc, SalesHistoryState>(
          builder: (context, state) {
            if (state.status == SalesHistoryStatus.loading &&
                state.selectedSale == null) {
              return const LoadingWidget();
            }

            final sale = state.selectedSale;
            if (sale == null) {
              return ErrorStateWidget(
                message: state.message ?? l10n.msgSomethingWentWrong,
                retryLabel: l10n.btnRetry,
                onRetry: () => context.read<SalesHistoryBloc>().add(
                      SalesHistoryLoadDetailsEvent(id: widget.saleId),
                    ),
              );
            }

            return FutureBuilder(
              future: ReceiptActions.buildReceiptData(sale, l10n),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const LoadingWidget();
                }
                if (!snapshot.hasData) {
                  return ErrorStateWidget(
                    message: l10n.msgSomethingWentWrong,
                    retryLabel: l10n.btnRetry,
                    onRetry: () => setState(() {}),
                  );
                }

                final data = snapshot.data!;

                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(AppDimensions.pagePadding),
                        children: [
                          Text(
                            l10n.receiptPreviewTitle,
                            style: AppTextStyles.headlineSmall,
                          ),
                          const SizedBox(height: AppDimensions.space16),
                          RepaintBoundary(
                            key: _receiptKey,
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusMedium,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ImageReceiptRenderer().buildWidget(data),
                            ),
                          ),
                          const SizedBox(height: AppDimensions.space24),
                        ],
                      ),
                    ),
                    SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppDimensions.pagePadding,
                          AppDimensions.space8,
                          AppDimensions.pagePadding,
                          AppDimensions.pagePadding,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButtonWidget(
                                label: l10n.receiptDownloadButton,
                                icon: LucideIcons.download,
                                isLoading: _actionBusy,
                                onPressed: _actionBusy
                                    ? null
                                    : () => _downloadReceipt(context, l10n),
                              ),
                            ),
                            const SizedBox(width: AppDimensions.space12),
                            Expanded(
                              child: PrimaryButton(
                                label: l10n.receiptShareButton,
                                icon: LucideIcons.share2,
                                isLoading: _actionBusy,
                                onPressed: _actionBusy
                                    ? null
                                    : () => _shareReceipt(context, l10n),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
