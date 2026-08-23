import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../categories/domain/entities/category_entity.dart';

/// Dialog shown when deleting a category that still has products assigned.
class CategoryReassignDialog extends StatefulWidget {
  const CategoryReassignDialog({
    required this.category,
    required this.productCount,
    required this.otherCategories,
    super.key,
  });

  final CategoryEntity category;
  final int productCount;
  final List<CategoryEntity> otherCategories;

  static Future<String?> show(
    BuildContext context, {
    required CategoryEntity category,
    required int productCount,
    required List<CategoryEntity> otherCategories,
  }) {
    return showDialog<String>(
      context: context,
      builder: (_) => CategoryReassignDialog(
        category: category,
        productCount: productCount,
        otherCategories: otherCategories,
      ),
    );
  }

  @override
  State<CategoryReassignDialog> createState() => _CategoryReassignDialogState();
}

class _CategoryReassignDialogState extends State<CategoryReassignDialog> {
  String? _targetCategoryId;

  @override
  void initState() {
    super.initState();
    if (widget.otherCategories.isNotEmpty) {
      _targetCategoryId = widget.otherCategories.first.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(l10n.categoryDeleteBlockedTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.categoryDeleteBlockedMessage(
              widget.category.name,
              widget.productCount,
            ),
          ),
          const SizedBox(height: AppDimensions.space16),
          DropdownButtonFormField<String>(
            initialValue: _targetCategoryId,
            decoration: InputDecoration(
              labelText: l10n.categoryReassignTargetLabel,
              border: const OutlineInputBorder(),
            ),
            items: widget.otherCategories
                .map(
                  (category) => DropdownMenuItem(
                    value: category.id,
                    child: Text(category.name),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(() => _targetCategoryId = value),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.btnCancel),
        ),
        TextButton(
          onPressed: _targetCategoryId == null
              ? null
              : () => Navigator.pop(context, _targetCategoryId),
          child: Text(l10n.categoryReassignAndDelete),
        ),
      ],
    );
  }
}

/// Inline warning when selling price is below purchase price.
class PriceBelowCostBanner extends StatelessWidget {
  const PriceBelowCostBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.space12),
      decoration: BoxDecoration(
        color: AppColors.tertiaryLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        border: Border.all(color: AppColors.tertiary.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: AppColors.tertiary,
            size: 20,
          ),
          const SizedBox(width: AppDimensions.space8),
          Expanded(
            child: Text(
              l10n.productPriceBelowCostWarning,
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.tertiary),
            ),
          ),
        ],
      ),
    );
  }
}
