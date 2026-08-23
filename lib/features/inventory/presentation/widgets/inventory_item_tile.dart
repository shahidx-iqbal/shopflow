import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../products/domain/entities/product_entity.dart';

/// Inventory list item showing stock status.
class InventoryItemTile extends StatelessWidget {
  const InventoryItemTile({
    required this.product,
    required this.onTap,
    super.key,
  });

  final ProductEntity product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isLow = product.stock <= product.lowStockThreshold;
    final isOut = product.stock <= 0;
    return ListTile(
      onTap: onTap,
      title: Text(product.name, style: AppTextStyles.labelMedium),
      subtitle: Text('${product.stock} ${product.unit}'),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: (isOut
                  ? AppColors.danger
                  : isLow
                      ? AppColors.tertiary
                      : AppColors.primary)
              .withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          isOut
              ? 'Out'
              : isLow
                  ? 'Low'
                  : 'OK',
          style: AppTextStyles.labelSmall.copyWith(
            color: isOut
                ? AppColors.danger
                : isLow
                    ? AppColors.tertiary
                    : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
