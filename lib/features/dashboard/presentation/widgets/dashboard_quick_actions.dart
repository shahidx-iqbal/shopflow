import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../l10n/app_localizations.dart';

/// Quick action shortcuts — row on mobile, 2×2 grid on desktop.
class DashboardQuickActions extends StatelessWidget {
  const DashboardQuickActions({required this.isDesktop, super.key});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (isDesktop) {
      final actions = [
        (LucideIcons.plus, l10n.dashboardAddProduct, RouteNames.addProduct),
        (LucideIcons.bookOpen, l10n.dashboardOpenLedger, RouteNames.ledgerList),
        (LucideIcons.scanBarcode, l10n.dashboardScanItem, RouteNames.barcodeScanner),
        (LucideIcons.receipt, l10n.dashboardPrintLastBill, RouteNames.salesHistory),
      ];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.dashboardQuickActions, style: AppTextStyles.headlineSmall),
          const SizedBox(height: AppDimensions.space12),
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = AppDimensions.space12;
              const minTileWidth = 132.0;
              final maxWidth = constraints.maxWidth;
              final columns = maxWidth >= minTileWidth * 2 + spacing ? 2 : 1;
              final tileWidth =
                  (maxWidth - spacing * (columns - 1)) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: actions.map((a) {
                  return SizedBox(
                    width: tileWidth,
                    child: _DesktopActionTile(
                      icon: a.$1,
                      label: a.$2,
                      onTap: () => context.push(a.$3),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      );
    }

    final actions = [
      (LucideIcons.shoppingCart, AppColors.primary, l10n.dashboardNewSale, RouteNames.posCheckout),
      (LucideIcons.packagePlus, AppColors.primary, l10n.dashboardAddProduct, RouteNames.addProduct),
      (LucideIcons.users, AppColors.secondary, l10n.customersTitle, RouteNames.customerList),
      (LucideIcons.bookOpen, const Color(0xFF92400E), l10n.ledgerTitle, RouteNames.ledgerList),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.dashboardQuickActions, style: AppTextStyles.headlineSmall),
        const SizedBox(height: AppDimensions.space16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: actions.map((a) {
            return _MobileActionItem(
              icon: a.$1,
              color: a.$2,
              label: a.$3,
              onTap: () => context.push(a.$4),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _MobileActionItem extends StatelessWidget {
  const _MobileActionItem({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: AppDimensions.space8),
          Text(label, style: AppTextStyles.labelSmall),
        ],
      ),
    );
  }
}

class _DesktopActionTile extends StatelessWidget {
  const _DesktopActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.secondaryLight,
      borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.space12,
            vertical: AppDimensions.space16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.secondary, size: 28),
              const SizedBox(height: AppDimensions.space12),
              Text(
                label,
                style: AppTextStyles.labelMedium,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
