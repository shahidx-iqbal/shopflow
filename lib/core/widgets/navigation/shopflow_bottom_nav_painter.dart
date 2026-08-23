import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'shopflow_bottom_nav_shape.dart';

/// Paints the pill-shaped green bar with a top-center notch for the FAB.
class ShopflowBottomNavPainter extends CustomPainter {
  ShopflowBottomNavPainter({
    required this.backgroundColor,
    required this.notchRadius,
    required this.cornerRadius,
  });

  final Color backgroundColor;
  final double notchRadius;
  final double cornerRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final path = ShopflowBottomNavShape.buildPath(
      size: size,
      cornerRadius: cornerRadius,
      notchRadius: notchRadius,
    );

    canvas.drawShadow(
      path,
      AppColors.textPrimary.withValues(alpha: 0.14),
      18,
      false,
    );

    canvas.drawPath(
      path,
      Paint()
        ..color = backgroundColor
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant ShopflowBottomNavPainter oldDelegate) {
    return oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.notchRadius != notchRadius ||
        oldDelegate.cornerRadius != cornerRadius;
  }
}
