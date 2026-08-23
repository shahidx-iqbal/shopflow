import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../l10n/app_localizations.dart';
import '../../constants/app_colors.dart';
import 'shopflow_bottom_nav_dimensions.dart';
import 'shopflow_bottom_nav_fab.dart';
import 'shopflow_bottom_nav_item.dart';
import 'shopflow_bottom_nav_painter.dart';
import 'shopflow_bottom_nav_shape.dart';

/// Tab index constants for [ShopflowBottomNav].
abstract class ShopflowBottomNavTab {
  static const int dashboard = 0;
  static const int sales = 1;
  static const int inventory = 2;
  static const int more = 3;
}

/// Floating pill bottom bar with center-notched FAB for ShopFlow mobile.
class ShopflowBottomNav extends StatelessWidget {
  const ShopflowBottomNav({
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onNewSale,
    required this.onMoreTap,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onNewSale;
  final VoidCallback onMoreTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final cornerRadius = ShopflowBottomNavDimensions.barCornerRadius;
    final notchRadius = ShopflowBottomNavDimensions.fabNotchRadius;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        ShopflowBottomNavDimensions.horizontalMargin,
        0,
        ShopflowBottomNavDimensions.horizontalMargin,
        bottomInset + ShopflowBottomNavDimensions.bottomOffset,
      ),
      child: SizedBox(
        height: ShopflowBottomNavDimensions.stackHeight,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: ShopflowBottomNavDimensions.barHeight,
              child: ClipPath(
                clipper: ShopflowBottomNavClipper(
                  cornerRadius: cornerRadius,
                  notchRadius: notchRadius,
                ),
                child: CustomPaint(
                  painter: ShopflowBottomNavPainter(
                    backgroundColor: AppColors.primary,
                    notchRadius: notchRadius,
                    cornerRadius: cornerRadius,
                  ),
                  child: SizedBox(
                    height: ShopflowBottomNavDimensions.barHeight,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: ShopflowBottomNavItem(
                            icon: LucideIcons.house,
                            label: l10n.dashboardTitle,
                            isActive: selectedIndex ==
                                ShopflowBottomNavTab.dashboard,
                            onTap: () => onTabSelected(
                              ShopflowBottomNavTab.dashboard,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ShopflowBottomNavItem(
                            icon: LucideIcons.receipt,
                            label: l10n.dashboardNavSales,
                            isActive:
                                selectedIndex == ShopflowBottomNavTab.sales,
                            onTap: () =>
                                onTabSelected(ShopflowBottomNavTab.sales),
                          ),
                        ),
                        SizedBox(
                          width: ShopflowBottomNavDimensions.fabSize +
                              ShopflowBottomNavDimensions.fabNotchMargin * 2,
                        ),
                        Expanded(
                          child: ShopflowBottomNavItem(
                            icon: LucideIcons.package,
                            label: l10n.inventoryTitle,
                            isActive: selectedIndex ==
                                ShopflowBottomNavTab.inventory,
                            onTap: () => onTabSelected(
                              ShopflowBottomNavTab.inventory,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ShopflowBottomNavItem(
                            icon: LucideIcons.layoutGrid,
                            label: l10n.dashboardNavMore,
                            isActive:
                                selectedIndex == ShopflowBottomNavTab.more,
                            onTap: onMoreTap,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: ShopflowBottomNavFab(onPressed: onNewSale),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
