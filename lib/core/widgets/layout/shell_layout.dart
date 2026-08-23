import 'package:flutter/material.dart';

import '../../constants/app_breakpoints.dart';
import '../../constants/app_dimensions.dart';
import '../navigation/shopflow_bottom_nav_dimensions.dart';

/// Layout helpers for [AppShell] — spacing differs between mobile bottom nav and desktop sidebar.
class ShellLayout {
  ShellLayout._();

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

  /// Bottom padding for tab-root scroll content — reserves space for the floating bottom nav on mobile.
  static double tabContentBottomPadding(BuildContext context) {
    if (isDesktop(context)) return AppDimensions.space32;
    return ShopflowBottomNavDimensions.contentBottomInset;
  }

  /// Standard bottom padding for pushed/detail screens inside the shell.
  static double detailContentBottomPadding(BuildContext context) {
    if (isDesktop(context)) return AppDimensions.space32;
    return AppDimensions.pagePadding;
  }
}
