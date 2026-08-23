import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/media/app_cached_image.dart';
import '../../domain/entities/product_entity.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({required this.product, required this.onTap, super.key});
  final ProductEntity product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final low = product.stock <= product.lowStockThreshold;
    return ListTile(
      onTap: onTap,
      leading: AppCachedImage(
        imagePath: product.imageUrl,
        width: 48,
        height: 48,
        borderRadius: BorderRadius.circular(8),
        placeholderIcon: LucideIcons.package,
      ),
      title: Text(product.name, style: AppTextStyles.labelMedium),
      subtitle: Text(product.barcode, style: AppTextStyles.bodySmall),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(Formatters.currency(product.price), style: AppTextStyles.numberSmall),
          Text(
            '${product.stock} ${product.unit}',
            style: AppTextStyles.bodySmall.copyWith(
              color: low ? AppColors.danger : AppColors.neutral,
            ),
          ),
        ],
      ),
    );
  }
}
