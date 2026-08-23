import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../l10n/app_localizations.dart';

/// Sticky bottom bar showing cart totals and confirm CTA.
class CartSummaryBar extends StatelessWidget {
  const CartSummaryBar({
    required this.total,
    required this.onConfirm,
    this.subtotal,
    this.cartDiscount = 0,
    this.tax = 0,
    this.changeDue = 0,
    this.ledgerRemainder = 0,
    this.isLoading = false,
    this.enabled = true,
    super.key,
  });

  final double total;
  final double? subtotal;
  final double cartDiscount;
  final double tax;
  final double changeDue;
  final double ledgerRemainder;
  final VoidCallback onConfirm;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(AppDimensions.space16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (subtotal != null && (cartDiscount > 0 || tax > 0)) ...[
              _Row(label: l10n.posSubtotal, value: subtotal!),
              if (cartDiscount > 0)
                _Row(label: l10n.posCartDiscount, value: -cartDiscount),
              if (tax > 0) _Row(label: l10n.posTax, value: tax),
              const SizedBox(height: AppDimensions.space8),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.posTotal, style: AppTextStyles.labelLarge),
                Text(
                  Formatters.currency(total),
                  style: AppTextStyles.numberLarge,
                ),
              ],
            ),
            if (changeDue > 0) ...[
              const SizedBox(height: AppDimensions.space8),
              _Row(label: l10n.posChangeDue, value: changeDue),
            ],
            if (ledgerRemainder > 0) ...[
              const SizedBox(height: AppDimensions.space8),
              _Row(label: l10n.posLedgerRemainder, value: ledgerRemainder),
            ],
            const SizedBox(height: AppDimensions.space16),
            PrimaryButton(
              label: l10n.posConfirmSale,
              onPressed: enabled ? onConfirm : null,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodySmall),
        Text(Formatters.currency(value), style: AppTextStyles.numberSmall),
      ],
    );
  }
}
