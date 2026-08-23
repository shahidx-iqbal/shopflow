import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import 'shopflow_bottom_nav_dimensions.dart';

/// Center docked FAB — white circle, green ring, bold "+" for New Sale.
class ShopflowBottomNavFab extends StatefulWidget {
  const ShopflowBottomNavFab({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  State<ShopflowBottomNavFab> createState() => _ShopflowBottomNavFabState();
}

class _ShopflowBottomNavFabState extends State<ShopflowBottomNavFab> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final size = ShopflowBottomNavDimensions.fabSize;
    final borderWidth = ShopflowBottomNavDimensions.fabBorderWidth;
    final scale = _pressed ? 0.92 : 1.0;
    final ringColor = _pressed
        ? Color.lerp(AppColors.primary, AppColors.textPrimary, 0.22)!
        : AppColors.primary;

    return Semantics(
      button: true,
      label: 'New Sale',
      child: GestureDetector(
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) => _setPressed(false),
        onTapCancel: () => _setPressed(false),
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surface,
              border: Border.all(color: ringColor, width: borderWidth),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textPrimary.withValues(alpha: 0.16),
                  blurRadius: _pressed ? 10 : 20,
                  offset: Offset(0, _pressed ? 3 : 8),
                ),
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  blurRadius: _pressed ? 6 : 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              '+',
              style: AppTextStyles.headlineLarge.copyWith(
                color: AppColors.primary,
                fontSize: 34,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
