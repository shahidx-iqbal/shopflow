import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/receipt/receipt_preview_sheet.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/buttons/outlined_button_widget.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../../../pos/domain/entities/cart_item_entity.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../../../pos/domain/entities/sale_enums.dart';
import '../../domain/entities/receipt_settings_entity.dart';
import '../cubit/receipt_settings_cubit.dart';
import '../widgets/settings_switch_row.dart';

/// Receipt template settings — toggles autosave, preview uses [ReceiptTemplateBuilder].
class ReceiptSettingsPage extends StatefulWidget {
  const ReceiptSettingsPage({super.key});

  @override
  State<ReceiptSettingsPage> createState() => _ReceiptSettingsPageState();
}

class _ReceiptSettingsPageState extends State<ReceiptSettingsPage> {
  final _headerNote = TextEditingController();
  final _footerNote = TextEditingController();
  final _prefix = TextEditingController();
  bool _textInitialized = false;

  @override
  void dispose() {
    _headerNote.dispose();
    _footerNote.dispose();
    _prefix.dispose();
    super.dispose();
  }

  void _initTextFields(ReceiptSettingsEntity settings) {
    if (_textInitialized) return;
    _headerNote.text = settings.headerNote;
    _footerNote.text = settings.footerNote;
    _prefix.text = settings.receiptNumberPrefix;
    _textInitialized = true;
  }

  Future<void> _previewReceipt(
    BuildContext context,
    ReceiptSettingsEntity settings,
  ) async {
    final sampleSale = SaleEntity(
      id: '1001',
      items: const [
        CartItemEntity(
          productId: 'p1',
          productName: 'Basmati Rice 5kg',
          barcode: '8901234567890',
          unit: 'bag',
          unitPrice: 1200,
          quantity: 2,
        ),
        CartItemEntity(
          productId: 'p2',
          productName: 'Cooking Oil 1L',
          barcode: '8901234567891',
          unit: 'bottle',
          unitPrice: 650,
          quantity: 1,
        ),
      ],
      saleType: SaleType.ledger,
      customer: CustomerEntity(
        id: 'c1',
        name: 'Ali Hassan',
        phone: '+923001112233',
        balance: 5000,
        createdAt: DateTime.now(),
      ),
      paymentStatus: PaymentStatus.partiallyPaid,
      subtotal: 3050,
      amountPaidNow: 1000,
      addedToLedger: 2050,
      total: 3050,
      createdAt: DateTime.now(),
    );

    await ReceiptPreviewSheet.show(
      context,
      sale: sampleSale,
      settingsOverride: settings,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => getIt<ReceiptSettingsCubit>()..loadSettings(),
      child: BlocBuilder<ReceiptSettingsCubit, ReceiptSettingsState>(
        builder: (context, state) {
          if (state.status == ReceiptSettingsStatus.loading &&
              state.settings == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.moreMenuReceiptSettings,
                showBackButton: true,
              ),
              body: const LoadingWidget(),
            );
          }
          if (state.status == ReceiptSettingsStatus.error &&
              state.settings == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.moreMenuReceiptSettings,
                showBackButton: true,
              ),
              body: ErrorStateWidget(
                message: state.message ?? l10n.msgSomethingWentWrong,
                retryLabel: l10n.btnRetry,
                onRetry: () =>
                    context.read<ReceiptSettingsCubit>().loadSettings(),
              ),
            );
          }

          final settings = state.settings;
          if (settings == null) return const SizedBox.shrink();
          _initTextFields(settings);
          final cubit = context.read<ReceiptSettingsCubit>();

          void patch(ReceiptSettingsEntity next, {bool debounce = false}) {
            cubit.updateSettings(next, debounce: debounce);
          }

          return Scaffold(
            appBar: AppTopBar(
              title: l10n.moreMenuReceiptSettings,
              showBackButton: true,
            ),
            body: ListView(
              padding: const EdgeInsets.only(bottom: AppDimensions.space32),
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppDimensions.pagePadding),
                  child: Text(
                    l10n.receiptSettingsDisplaySection,
                    style: AppTextStyles.headlineSmall,
                  ),
                ),
                SettingsSwitchRow(
                  label: l10n.receiptShowLogo,
                  value: settings.showLogo,
                  onChanged: (v) => patch(settings.copyWith(showLogo: v)),
                ),
                SettingsSwitchRow(
                  label: l10n.receiptShowAddress,
                  value: settings.showAddress,
                  onChanged: (v) => patch(settings.copyWith(showAddress: v)),
                ),
                SettingsSwitchRow(
                  label: l10n.receiptShowPhone,
                  value: settings.showPhone,
                  onChanged: (v) => patch(settings.copyWith(showPhone: v)),
                ),
                SettingsSwitchRow(
                  label: l10n.receiptShowTaxNumber,
                  value: settings.showTaxNumber,
                  onChanged: (v) => patch(settings.copyWith(showTaxNumber: v)),
                ),
                SettingsSwitchRow(
                  label: l10n.receiptShowCustomerName,
                  value: settings.showCustomerName,
                  onChanged: (v) =>
                      patch(settings.copyWith(showCustomerName: v)),
                ),
                SettingsSwitchRow(
                  label: l10n.receiptShowLedgerBalance,
                  value: settings.showLedgerBalance,
                  onChanged: (v) =>
                      patch(settings.copyWith(showLedgerBalance: v)),
                ),
                SettingsSwitchRow(
                  label: l10n.receiptShowPaymentMethod,
                  value: settings.showPaymentMethod,
                  onChanged: (v) =>
                      patch(settings.copyWith(showPaymentMethod: v)),
                ),
                SettingsSwitchRow(
                  label: l10n.receiptShowCashierName,
                  value: settings.showCashierName,
                  onChanged: (v) => patch(settings.copyWith(showCashierName: v)),
                ),
                const SizedBox(height: AppDimensions.space16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.pagePadding,
                  ),
                  child: Text(
                    l10n.receiptSettingsNotesSection,
                    style: AppTextStyles.headlineSmall,
                  ),
                ),
                const SizedBox(height: AppDimensions.space8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.pagePadding,
                  ),
                  child: AppTextField(
                    label: l10n.receiptHeaderNoteLabel,
                    controller: _headerNote,
                    maxLines: 2,
                    onChanged: (_) => patch(
                      settings.copyWith(headerNote: _headerNote.text),
                      debounce: true,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.space12),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.pagePadding,
                  ),
                  child: AppTextField(
                    label: l10n.settingsReceiptFooter,
                    controller: _footerNote,
                    maxLines: 2,
                    onChanged: (_) => patch(
                      settings.copyWith(footerNote: _footerNote.text),
                      debounce: true,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.space12),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.pagePadding,
                  ),
                  child: AppTextField(
                    label: l10n.receiptNumberPrefixLabel,
                    controller: _prefix,
                    onChanged: (_) => patch(
                      settings.copyWith(receiptNumberPrefix: _prefix.text),
                      debounce: true,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.space24),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.pagePadding,
                  ),
                  child: OutlinedButtonWidget(
                    label: l10n.receiptPreviewButton,
                    icon: LucideIcons.eye,
                    onPressed: () => _previewReceipt(context, settings),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
