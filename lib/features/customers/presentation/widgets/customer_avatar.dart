import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../utils/customer_initials.dart';

/// Circular avatar showing customer initials.
class CustomerAvatar extends StatelessWidget {
  const CustomerAvatar({
    required this.name,
    this.radius = 24,
    super.key,
  });

  final String name;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primaryLight,
      child: Text(
        customerInitials(name),
        style: AppTextStyles.labelMedium.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
