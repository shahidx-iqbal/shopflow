import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Shared pill + notch path for the bottom navigation bar.
class ShopflowBottomNavShape {
  ShopflowBottomNavShape._();

  static Path buildPath({
    required Size size,
    required double cornerRadius,
    required double notchRadius,
  }) {
    final r = math.min(
      cornerRadius,
      math.min(size.width, size.height) / 2,
    ).toDouble();
    final centerX = size.width / 2;
    final maxNotch = math.max(0.0, centerX - r - 4);
    final notchR = math.min(notchRadius, maxNotch).toDouble();

    if (notchR <= 0) {
      return Path()
        ..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height),
            Radius.circular(r),
          ),
        );
    }

    final path = Path();
    path.moveTo(r, 0);
    path.lineTo(centerX - notchR, 0);
    path.arcToPoint(
      Offset(centerX + notchR, 0),
      radius: Radius.circular(notchR),
      clockwise: true,
    );
    path.lineTo(size.width - r, 0);
    path.arcToPoint(
      Offset(size.width, r),
      radius: Radius.circular(r),
    );
    path.lineTo(size.width, size.height - r);
    path.arcToPoint(
      Offset(size.width - r, size.height),
      radius: Radius.circular(r),
    );
    path.lineTo(r, size.height);
    path.arcToPoint(
      Offset(0, size.height - r),
      radius: Radius.circular(r),
    );
    path.lineTo(0, r);
    path.arcToPoint(
      Offset(r, 0),
      radius: Radius.circular(r),
    );
    path.close();
    return path;
  }
}

/// Clips the bar to the pill shape with a top-center FAB notch.
class ShopflowBottomNavClipper extends CustomClipper<Path> {
  ShopflowBottomNavClipper({
    required this.cornerRadius,
    required this.notchRadius,
  });

  final double cornerRadius;
  final double notchRadius;

  @override
  Path getClip(Size size) => ShopflowBottomNavShape.buildPath(
        size: size,
        cornerRadius: cornerRadius,
        notchRadius: notchRadius,
      );

  @override
  bool shouldReclip(covariant ShopflowBottomNavClipper oldClipper) {
    return oldClipper.cornerRadius != cornerRadius ||
        oldClipper.notchRadius != notchRadius;
  }
}
