import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';

/// Shared header used on auth screens (title + subtitle).
class AuthHeader extends StatelessWidget {
  const AuthHeader({
    required this.title,
    required this.subtitle,
    this.centered = false,
    super.key,
  });

  final String title;
  final String subtitle;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.headlineLarge,
          textAlign: centered ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: AppDimensions.space8),
        Text(
          subtitle,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.neutral),
          textAlign: centered ? TextAlign.center : TextAlign.start,
        ),
      ],
    );
  }
}
