import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

/// Subtle dotted background used on auth screens.
class AuthDotBackground extends StatelessWidget {
  const AuthDotBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: _DotPatternPainter(
            color: AppColors.neutral.withValues(alpha: 0.18),
          ),
        ),
        child,
      ],
    );
  }
}

class _DotPatternPainter extends CustomPainter {
  _DotPatternPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const spacing = 22.0;
    const radius = 1.2;
    final paint = Paint()..color = color;

    for (var x = spacing / 2; x < size.width; x += spacing) {
      for (var y = spacing / 2; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
