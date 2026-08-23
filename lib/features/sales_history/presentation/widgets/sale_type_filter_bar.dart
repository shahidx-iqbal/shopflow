import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../pos/domain/entities/sale_enums.dart';

/// Cash / Ledger / All filter bar for the Sales tab — uses design token colors.
class SaleTypeFilterBar extends StatelessWidget {
  const SaleTypeFilterBar({
    required this.selectedFilter,
    required this.onFilterChanged,
    super.key,
  });

  final SaleType? selectedFilter;
  final ValueChanged<SaleType?> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          child: _SaleFilterChip(
            label: l10n.salesFilterAll,
            selected: selectedFilter == null,
            accentColor: AppColors.textPrimary,
            onTap: () => onFilterChanged(null),
          ),
        ),
        const SizedBox(width: AppDimensions.space12),
        Expanded(
          child: _SaleFilterChip(
            label: l10n.salesFilterCash,
            selected: selectedFilter == SaleType.cash,
            accentColor: AppColors.primary,
            onTap: () => onFilterChanged(SaleType.cash),
          ),
        ),
        const SizedBox(width: AppDimensions.space12),
        Expanded(
          child: _SaleFilterChip(
            label: l10n.salesFilterLedger,
            selected: selectedFilter == SaleType.ledger,
            accentColor: AppColors.tertiary,
            onTap: () => onFilterChanged(SaleType.ledger),
          ),
        ),
      ],
    );
  }
}

class _SaleFilterChip extends StatelessWidget {
  const _SaleFilterChip({
    required this.label,
    required this.selected,
    required this.accentColor,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Color accentColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = selected ? accentColor : AppColors.surface;
    final foregroundColor = selected ? Colors.white : AppColors.neutral;
    final borderColor = selected ? accentColor : AppColors.border;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.space14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            border: Border.all(color: borderColor),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTextStyles.labelMedium.copyWith(color: foregroundColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
