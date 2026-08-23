import 'package:flutter/material.dart';

import '../../constants/app_breakpoints.dart';
import '../../constants/app_dimensions.dart';

/// Responsive page padding with optional max-width constraint.
class PageResponsiveBody extends StatelessWidget {
  const PageResponsiveBody({
    required this.child,
    this.maxWidth = 720,
    super.key,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: isDesktop ? maxWidth : double.infinity),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            isDesktop ? AppDimensions.space32 : AppDimensions.pagePadding,
            isDesktop ? AppDimensions.space24 : AppDimensions.space16,
            isDesktop ? AppDimensions.space32 : AppDimensions.pagePadding,
            AppDimensions.space16,
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Stacks children horizontally on wide screens, vertically on narrow.
class ResponsiveFormRow extends StatelessWidget {
  const ResponsiveFormRow({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 600;

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const SizedBox(width: AppDimensions.space12),
            Expanded(child: children[i]),
          ],
        ],
      );
    }

    return Column(
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) const SizedBox(height: AppDimensions.space16),
          children[i],
        ],
      ],
    );
  }
}
