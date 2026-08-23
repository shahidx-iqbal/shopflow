import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/category_entity.dart';
import '../utils/category_icons.dart';

/// Grid card for a single category, with optional edit/delete actions.
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    required this.onTap,
    this.onEdit,
    this.onDelete,
    super.key,
  });

  final CategoryEntity category;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hasActions = onEdit != null || onDelete != null;

    return AppCard(
      padding: EdgeInsets.zero,
      child: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusLarge,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppDimensions.space12,
                      AppDimensions.space8,
                      AppDimensions.space12,
                      AppDimensions.space12,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: hasActions ? 28 : 8),
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            CategoryIcons.resolve(category.icon),
                            color: AppColors.primary,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.space12),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              category.name,
                              style: AppTextStyles.labelMedium,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (hasActions)
              Positioned(
                top: 0,
                right: 0,
                child: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  icon: const Icon(
                    LucideIcons.ellipsisVertical,
                    size: 18,
                    color: AppColors.neutral,
                  ),
                  onSelected: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (value == 'edit') onEdit?.call();
                      if (value == 'delete') onDelete?.call();
                    });
                  },
                  itemBuilder: (_) => [
                    if (onEdit != null)
                      PopupMenuItem(
                        value: 'edit',
                        child: Text(l10n.btnEdit),
                      ),
                    if (onDelete != null)
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          l10n.btnDelete,
                          style: const TextStyle(color: AppColors.danger),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
