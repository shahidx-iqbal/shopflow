import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../l10n/app_localizations.dart';

/// Live password requirement checklist for reset password.
class PasswordRequirementsPanel extends StatelessWidget {
  const PasswordRequirementsPanel({required this.password, super.key});

  final String password;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final checks = PasswordStrengthRules.evaluate(password);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.space16),
      decoration: BoxDecoration(
        color: AppColors.secondaryLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RequirementRow(
            met: checks.hasMinLength,
            label: l10n.resetPasswordRequirementLength,
          ),
          const SizedBox(height: AppDimensions.space8),
          _RequirementRow(
            met: checks.hasNumber,
            label: l10n.resetPasswordRequirementNumber,
          ),
          const SizedBox(height: AppDimensions.space8),
          _RequirementRow(
            met: checks.hasSpecialChar,
            label: l10n.resetPasswordRequirementSpecial,
          ),
        ],
      ),
    );
  }
}

class _RequirementRow extends StatelessWidget {
  const _RequirementRow({required this.met, required this.label});

  final bool met;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          met ? LucideIcons.circleCheck : LucideIcons.circle,
          size: 18,
          color: met ? AppColors.primary : AppColors.neutral,
        ),
        const SizedBox(width: AppDimensions.space8),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: met ? AppColors.textPrimary : AppColors.neutral,
            ),
          ),
        ),
      ],
    );
  }
}
