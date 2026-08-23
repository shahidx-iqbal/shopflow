import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';
import '../../constants/app_text_styles.dart';
import '../buttons/primary_button.dart';

/// Error state with icon, message, and retry button.
class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    required this.message,
    this.onRetry,
    this.retryLabel,
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;
  final String? retryLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.dangerLight,
                borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
              ),
              child: const Icon(
                LucideIcons.alertCircle,
                size: 40,
                color: AppColors.danger,
              ),
            ),
            const SizedBox(height: AppDimensions.space24),
            Text(
              message,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.neutral),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppDimensions.space24),
              PrimaryButton(
                label: retryLabel ?? 'Retry',
                onPressed: onRetry,
                isExpanded: false,
                icon: LucideIcons.refreshCw,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
