import 'package:flutter/material.dart';

import '../../constants/app_dimensions.dart';

/// Circular icon action button with solid colored background and white icon.
class IconActionButton extends StatelessWidget {
  const IconActionButton({
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    this.size = AppDimensions.iconButtonSize,
    this.iconSize = 22,
    this.tooltip,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final double size;
  final double iconSize;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final button = Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, color: Colors.white, size: iconSize),
        ),
      ),
    );

    if (tooltip != null) {
      return Tooltip(message: tooltip!, child: button);
    }
    return button;
  }
}
