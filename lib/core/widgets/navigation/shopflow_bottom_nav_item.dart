import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

/// Single tab icon inside the floating bottom navigation bar.
class ShopflowBottomNavItem extends StatelessWidget {
  const ShopflowBottomNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  static const double _inactiveOpacity = 0.55;
  static const double _activeHighlightOpacity = 0.10;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isActive,
      label: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(999),
          splashColor: AppColors.surface.withValues(alpha: 0.12),
          highlightColor: AppColors.surface.withValues(alpha: 0.08),
          child: SizedBox(
            height: double.infinity,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.surface.withValues(
                          alpha: _activeHighlightOpacity,
                        )
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: AppColors.surface.withValues(
                    alpha: isActive ? 1 : _inactiveOpacity,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
