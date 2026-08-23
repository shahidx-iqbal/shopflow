import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';
import '../../constants/app_text_styles.dart';

/// Bordered transparent button matching the Stitch design kit.
class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isExpanded = true,
    this.icon,
    this.borderColor,
    this.textColor,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isExpanded;
  final IconData? icon;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final effectiveTextColor = textColor ?? AppColors.textPrimary;
    final effectiveBorderColor = borderColor ?? AppColors.border;

    final child = isLoading
        ? SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: effectiveTextColor,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: effectiveTextColor),
                const SizedBox(width: AppDimensions.space8),
              ],
              Text(
                label,
                style:
                    AppTextStyles.labelLarge.copyWith(color: effectiveTextColor),
              ),
            ],
          );

    return SizedBox(
      width: isExpanded ? double.infinity : null,
      height: AppDimensions.buttonHeight,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: effectiveTextColor,
          side: BorderSide(color: effectiveBorderColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
          ),
        ),
        child: child,
      ),
    );
  }
}
