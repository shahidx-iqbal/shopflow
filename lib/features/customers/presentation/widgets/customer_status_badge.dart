import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';

/// Pill badge for ledger status — Outstanding or Clear.
class CustomerStatusBadge extends StatelessWidget {
  const CustomerStatusBadge({required this.hasOutstanding, super.key});

  final bool hasOutstanding;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final label = hasOutstanding ? l10n.ledgerOutstanding : l10n.customerStatusClear;
    final background =
        hasOutstanding ? AppColors.tertiaryLight : AppColors.primaryLight;
    final foreground =
        hasOutstanding ? AppColors.tertiary : AppColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.space10,
        vertical: AppDimensions.space4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelSmall.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
