import 'package:flutter/material.dart';

import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/layout/shell_layout.dart';

/// Applies responsive page padding and optional max-width constraint.
class CustomerResponsiveBody extends StatelessWidget {
  const CustomerResponsiveBody({
    required this.child,
    this.maxWidth = 960,
    this.includeBottomInset = true,
    super.key,
  });

  final Widget child;
  final double maxWidth;
  final bool includeBottomInset;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= AppBreakpoints.desktop;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: isDesktop ? maxWidth : double.infinity),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            isDesktop ? AppDimensions.space32 : AppDimensions.pagePadding,
            isDesktop ? AppDimensions.space24 : AppDimensions.space16,
            isDesktop ? AppDimensions.space32 : AppDimensions.pagePadding,
            isDesktop
                ? AppDimensions.space32
                : includeBottomInset
                    ? ShellLayout.tabContentBottomPadding(context)
                    : AppDimensions.pagePadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
