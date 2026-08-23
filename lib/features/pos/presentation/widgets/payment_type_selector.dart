import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/sale_enums.dart';

/// Toggle between Cash Sale and Ledger Sale.
class PaymentTypeSelector extends StatelessWidget {
  const PaymentTypeSelector({
    required this.selected,
    required this.onChanged,
    this.ledgerLocked = false,
    super.key,
  });

  final SaleType selected;
  final ValueChanged<SaleType> onChanged;
  final bool ledgerLocked;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: _Chip(
                label: l10n.posSaleTypeCash,
                selected: selected == SaleType.cash,
                color: AppColors.primary,
                onTap: () => onChanged(SaleType.cash),
              ),
            ),
            const SizedBox(width: AppDimensions.space12),
            Expanded(
              child: _Chip(
                label: l10n.posSaleTypeLedger,
                selected: selected == SaleType.ledger,
                color: AppColors.tertiary,
                enabled: !ledgerLocked,
                onTap: ledgerLocked ? null : () => onChanged(SaleType.ledger),
              ),
            ),
          ],
        ),
        if (ledgerLocked) ...[
          const SizedBox(height: AppDimensions.space8),
          Text(
            l10n.posLedgerLocked,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
          ),
        ],
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
    this.enabled = true,
  });
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = enabled ? color : AppColors.neutral;
    return Material(
      color: selected
          ? effectiveColor
          : effectiveColor.withValues(alpha: enabled ? 0.12 : 0.06),
      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.space16),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.labelMedium.copyWith(
              color: selected
                  ? Colors.white
                  : effectiveColor.withValues(alpha: enabled ? 1 : 0.5),
            ),
          ),
        ),
      ),
    );
  }
}
