import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';

/// Single settings row — icon badge, title, trailing chevron.
class MoreMenuTile extends StatelessWidget {
  const MoreMenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = AppColors.secondary,
    this.titleColor,
    this.showDivider = true,
    super.key,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final Color? titleColor;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.space16,
                vertical: AppDimensions.space14,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.12),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusMedium),
                    ),
                    child: Icon(icon, color: iconColor, size: 20),
                  ),
                  const SizedBox(width: AppDimensions.space16),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.labelLarge.copyWith(
                        color: titleColor ?? AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Icon(
                    LucideIcons.chevronRight,
                    size: 18,
                    color: AppColors.neutral.withValues(alpha: 0.6),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: AppDimensions.space16 + 40 + AppDimensions.space16,
            endIndent: AppDimensions.space16,
            color: AppColors.border,
          ),
      ],
    );
  }
}
