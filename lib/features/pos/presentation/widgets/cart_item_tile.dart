import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../domain/entities/cart_item_entity.dart';

/// Cart line item with quantity controls.
class CartItemTile extends StatelessWidget {
  const CartItemTile({
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
    super.key,
  });

  final CartItemEntity item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppDimensions.space8),
      title: Text(item.productName, style: AppTextStyles.labelMedium),
      subtitle: Text(
        '${Formatters.currency(item.unitPrice)} × ${item.quantity} ${item.unit} = ${Formatters.currency(item.lineTotal)}',
        style: AppTextStyles.numberSmall,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(LucideIcons.minus, size: 18),
            onPressed: onDecrement,
            color: AppColors.neutral,
          ),
          Text('${item.quantity}', style: AppTextStyles.labelLarge),
          IconButton(
            icon: const Icon(LucideIcons.plus, size: 18),
            onPressed: onIncrement,
            color: AppColors.primary,
          ),
          IconButton(
            icon: const Icon(LucideIcons.trash2, size: 18),
            onPressed: onRemove,
            color: AppColors.danger,
          ),
        ],
      ),
    );
  }
}
