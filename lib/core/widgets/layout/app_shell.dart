import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../constants/app_breakpoints.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';
import '../../constants/app_text_styles.dart';
import '../../routes/route_names.dart';
import '../../../l10n/app_localizations.dart';
import '../navigation/shopflow_bottom_nav.dart';
import '../navigation/shopflow_shell_navigation.dart';

/// Responsive app chrome: sidebar on desktop, bottom nav on mobile.
class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= AppBreakpoints.desktop) {
      return _DesktopShell(child: child);
    }
    return _MobileShell(child: child);
  }
}

class _DesktopShell extends StatelessWidget {
  const _DesktopShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final location = GoRouterState.of(context).uri.path;

    return SizedBox.expand(
      child: ColoredBox(
        color: AppColors.background,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Sidebar(currentPath: location, l10n: l10n),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({required this.currentPath, required this.l10n});

  final String currentPath;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final selectedTab = ShopflowShellNavigation.selectedTabIndex(currentPath);
    final newSaleActive = ShopflowShellNavigation.isNewSaleRoute(currentPath);

    final tabs = [
      (
        ShopflowBottomNavTab.dashboard,
        LucideIcons.house,
        l10n.dashboardTitle,
      ),
      (
        ShopflowBottomNavTab.sales,
        LucideIcons.receipt,
        l10n.dashboardNavSales,
      ),
      (
        ShopflowBottomNavTab.inventory,
        LucideIcons.package,
        l10n.inventoryTitle,
      ),
      (
        ShopflowBottomNavTab.more,
        LucideIcons.layoutGrid,
        l10n.dashboardNavMore,
      ),
    ];

    return Container(
      width: 240,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          right: BorderSide(color: AppColors.border),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimensions.space24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.space8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusSmall),
                  ),
                  child: const Icon(
                    LucideIcons.store,
                    color: AppColors.primary,
                    size: 22,
                  ),
                ),
                const SizedBox(width: AppDimensions.space12),
                Text(l10n.appName, style: AppTextStyles.headlineSmall),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.space12,
                vertical: AppDimensions.space16,
              ),
              children: [
                for (final tab in tabs) ...[
                  if (tab.$1 == ShopflowBottomNavTab.inventory) ...[
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppDimensions.space8,
                      ),
                      child: _SidebarNewSaleButton(
                        label: l10n.dashboardNewSale,
                        isActive: newSaleActive,
                        onTap: () =>
                            ShopflowShellNavigation.openNewSale(context),
                      ),
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppDimensions.space8,
                    ),
                    child: _SidebarTile(
                      icon: tab.$2,
                      label: tab.$3,
                      isActive: selectedTab == tab.$1,
                      onTap: () =>
                          ShopflowShellNavigation.goToTab(context, tab.$1),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarNewSaleButton extends StatelessWidget {
  const _SidebarNewSaleButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive ? AppColors.textPrimary : AppColors.primary,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.space16,
            vertical: AppDimensions.space12,
          ),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surface,
                  border: Border.all(
                    color: isActive ? AppColors.textPrimary : AppColors.primary,
                    width: 2,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '+',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: isActive ? AppColors.textPrimary : AppColors.primary,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.space12),
              Text(
                label,
                style: AppTextStyles.labelMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  const _SidebarTile({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive ? AppColors.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.space16,
            vertical: AppDimensions.space12,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: isActive ? Colors.white : AppColors.neutral,
              ),
              const SizedBox(width: AppDimensions.space12),
              Text(
                label,
                style: AppTextStyles.labelMedium.copyWith(
                  color: isActive ? Colors.white : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileShell extends StatelessWidget {
  const _MobileShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;
    final showBottomNav = RouteNames.isTabRoot(path);
    final selectedTab = ShopflowShellNavigation.selectedTabIndex(path);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: child,
      extendBody: showBottomNav,
      bottomNavigationBar: showBottomNav
          ? ShopflowBottomNav(
              selectedIndex: selectedTab,
              onTabSelected: (index) =>
                  ShopflowShellNavigation.goToTab(context, index),
              onNewSale: () => ShopflowShellNavigation.openNewSale(context),
              onMoreTap: () => context.go(RouteNames.more),
            )
          : null,
    );
  }
}
