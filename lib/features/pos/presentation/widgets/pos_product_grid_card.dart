import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/routes/product_details_route_args.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../../products/presentation/utils/product_stock_helper.dart';

/// Product card for POS — tap opens details; add button adds to cart.
class PosProductGridCard extends StatelessWidget {
  const PosProductGridCard({
    required this.product,
    required this.onAddToCart,
    super.key,
  });

  final ProductEntity product;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final stockStatus = ProductStockHelper.status(product);
    final canAdd = product.isActive && product.stock > 0;

    return AppCard(
      onTap: () => context.push(
        RouteNames.productDetailsPath(product.id),
        extra: ProductDetailsRouteArgs(
          posMode: true,
          onAddToCart: (_, p) => onAddToCart(),
        ),
      ),
      padding: EdgeInsets.zero,
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 11,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.secondaryLight,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(AppDimensions.radiusLarge),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          LucideIcons.package,
                          size: 40,
                          color: AppColors.secondary.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppDimensions.space8,
                    left: AppDimensions.space8,
                    right: AppDimensions.space8,
                    child: _StockBadge(
                      status: stockStatus,
                      stock: product.stock,
                      l10n: l10n,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.space12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product.categoryName != null)
                      Text(
                        product.categoryName!,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.neutral,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (product.categoryName != null)
                      const SizedBox(height: AppDimensions.space4),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          product.name,
                          style: AppTextStyles.labelMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            Formatters.currency(product.price),
                            style: AppTextStyles.numberSmall.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: AppDimensions.space8),
                        Material(
                          color: canAdd
                              ? AppColors.primary
                              : AppColors.border,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusSmall,
                          ),
                          child: InkWell(
                            onTap: canAdd
                                ? () {
                                    onAddToCart();
                                  }
                                : null,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusSmall,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDimensions.space8,
                                vertical: AppDimensions.space4,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    LucideIcons.plus,
                                    size: 14,
                                    color: canAdd
                                        ? Colors.white
                                        : AppColors.neutral,
                                  ),
                                  const SizedBox(width: AppDimensions.space4),
                                  Text(
                                    l10n.posAddToCart,
                                    style: AppTextStyles.labelSmall.copyWith(
                                      color: canAdd
                                          ? Colors.white
                                          : AppColors.neutral,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StockBadge extends StatelessWidget {
  const _StockBadge({
    required this.status,
    required this.stock,
    required this.l10n,
  });

  final ProductStockStatus status;
  final int stock;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final (label, color, bg, icon) = switch (status) {
      ProductStockStatus.inStock => (
          l10n.productInStockCount(stock),
          AppColors.primary,
          AppColors.primaryLight,
          LucideIcons.circleCheck,
        ),
      ProductStockStatus.lowStock => (
          l10n.productLowStockCount(stock),
          AppColors.tertiary,
          AppColors.tertiaryLight,
          LucideIcons.triangleAlert,
        ),
      ProductStockStatus.outOfStock => (
          l10n.inventoryOutOfStock,
          AppColors.danger,
          AppColors.dangerLight,
          LucideIcons.circleX,
        ),
    };

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.space8,
          vertical: AppDimensions.space4,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          boxShadow: [
            BoxShadow(
              color: AppColors.textPrimary.withValues(alpha: 0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: color),
            const SizedBox(width: AppDimensions.space4),
            Flexible(
              child: Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
