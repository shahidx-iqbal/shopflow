import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_names.dart';
import 'shopflow_bottom_nav.dart';

/// Shared tab selection and navigation for [AppShell] mobile and desktop chrome.
class ShopflowShellNavigation {
  ShopflowShellNavigation._();

  static int selectedTabIndex(String path) {
    if (path.startsWith(RouteNames.salesHistory)) {
      return ShopflowBottomNavTab.sales;
    }
    if (path.startsWith(RouteNames.inventory)) {
      return ShopflowBottomNavTab.inventory;
    }
    if (path.startsWith(RouteNames.more)) {
      return ShopflowBottomNavTab.more;
    }
    return ShopflowBottomNavTab.dashboard;
  }

  static bool isTabSelected(int tabIndex, String path) =>
      selectedTabIndex(path) == tabIndex;

  static bool isNewSaleRoute(String path) =>
      path.startsWith(RouteNames.posCheckout) ||
      path.startsWith(RouteNames.barcodeScanner);

  static void goToTab(BuildContext context, int index) {
    switch (index) {
      case ShopflowBottomNavTab.dashboard:
        context.go(RouteNames.dashboard);
      case ShopflowBottomNavTab.sales:
        context.go(RouteNames.salesHistory);
      case ShopflowBottomNavTab.inventory:
        context.go(RouteNames.inventory);
      case ShopflowBottomNavTab.more:
        context.go(RouteNames.more);
    }
  }

  static void openNewSale(BuildContext context) =>
      context.push(RouteNames.posCheckout);
}
