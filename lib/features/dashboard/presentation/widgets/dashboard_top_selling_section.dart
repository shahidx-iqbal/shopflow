import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/dashboard_top_product_entity.dart';

/// Horizontal product carousel (mobile) or grid row (desktop).
class DashboardTopSellingSection extends StatelessWidget {
  const DashboardTopSellingSection({
    required this.products,
    required this.isDesktop,
    super.key,
  });

  final List<DashboardTopProductEntity> products;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                isDesktop ? l10n.dashboardTopSellingProducts : l10n.dashboardTopSelling,
                style: AppTextStyles.headlineSmall,
              ),
            ),
            TextButton(
              onPressed: () => context.push(RouteNames.productList),
              child: Text(l10n.dashboardViewAll),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.space12),
        if (isDesktop)
          SizedBox(
            height: 220,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: products.take(4).map((p) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: AppDimensions.space12,
                    ),
                    child: _ProductCard(
                      product: p,
                      isDesktop: true,
                      l10n: l10n,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        else
          SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: AppDimensions.space12),
              itemBuilder: (_, index) => SizedBox(
                width: 140,
                height: 190,
                child: _ProductCard(
                  product: products[index],
                  isDesktop: false,
                  l10n: l10n,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.isDesktop,
    required this.l10n,
  });

  final DashboardTopProductEntity product;
  final bool isDesktop;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.space12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop)
            Expanded(child: _ProductImage(product: product))
          else
            AspectRatio(
              aspectRatio: 1,
              child: _ProductImage(product: product),
            ),
          const SizedBox(height: AppDimensions.space8),
          Text(
            product.name,
            style: AppTextStyles.labelMedium,
            maxLines: isDesktop ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppDimensions.space4),
          Text(
            isDesktop
                ? l10n.dashboardUnitsSold(product.unitsSold)
                : Formatters.currency(product.price),
            style: AppTextStyles.bodySmall.copyWith(
              color: isDesktop ? AppColors.neutral : AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.product});

  final DashboardTopProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      clipBehavior: Clip.antiAlias,
      child: product.imageUrl != null
          ? Image.network(
              product.imageUrl!,
              fit: BoxFit.cover,
            )
          : Center(
              child: Text(
                product.name.isNotEmpty ? product.name[0] : '?',
                style: AppTextStyles.headlineMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
    );
  }
}
