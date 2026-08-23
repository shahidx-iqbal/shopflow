import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/category_entity.dart';
import '../utils/category_icons.dart';

/// Result returned when the category form sheet is saved or deleted.
class CategoryFormResult {
  const CategoryFormResult.save({
    required this.name,
    required this.icon,
  }) : delete = false;

  const CategoryFormResult.deleted()
      : name = null,
        icon = null,
        delete = true;

  final String? name;
  final String? icon;
  final bool delete;
}

/// Bottom sheet for adding or editing a category (name + icon picker).
class CategoryFormSheet extends StatefulWidget {
  const CategoryFormSheet({this.category, super.key});

  final CategoryEntity? category;

  static Future<CategoryFormResult?> show(
    BuildContext context, {
    CategoryEntity? category,
  }) {
    return showModalBottomSheet<CategoryFormResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      builder: (_) => CategoryFormSheet(category: category),
    );
  }

  bool get isEditing => category != null;

  @override
  State<CategoryFormSheet> createState() => _CategoryFormSheetState();
}

class _CategoryFormSheetState extends State<CategoryFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late String _selectedIcon;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category?.name ?? '');
    _selectedIcon = widget.category?.icon ?? CategoryIcons.pickerKeys.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final name = _nameController.text.trim();
    Navigator.pop(
      context,
      CategoryFormResult.save(name: name, icon: _selectedIcon),
    );
  }

  void _requestDelete() {
    Navigator.pop(context, const CategoryFormResult.deleted());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppDimensions.space12),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimensions.space16,
                AppDimensions.space16,
                AppDimensions.space8,
                AppDimensions.space12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.isEditing
                          ? l10n.categoryEditTitle
                          : l10n.categoriesAdd,
                      style: AppTextStyles.headlineSmall,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(LucideIcons.x),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.border),
            Padding(
              padding: const EdgeInsets.all(AppDimensions.space16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTextField(
                      label: l10n.categoryNameLabel,
                      hint: l10n.categoryNameHint,
                      controller: _nameController,
                      prefixIcon: LucideIcons.shapes,
                      textInputAction: TextInputAction.done,
                      validator: (value) => Validators.minLength(
                        value,
                        2,
                        requiredMessage: l10n.validationCategoryNameRequired,
                        minLengthMessage: l10n.validationCategoryNameMinLength,
                      ),
                    ),
                  const SizedBox(height: AppDimensions.space24),
                  Text(
                    l10n.categorySelectIcon,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.neutral,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.space12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: AppDimensions.space12,
                      crossAxisSpacing: AppDimensions.space12,
                      childAspectRatio: 1,
                    ),
                    itemCount: CategoryIcons.pickerKeys.length,
                    itemBuilder: (context, index) {
                      final key = CategoryIcons.pickerKeys[index];
                      final selected = key == _selectedIcon;
                      return InkWell(
                        onTap: () => setState(() => _selectedIcon = key),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusMedium),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.primary
                                : AppColors.surface,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMedium,
                            ),
                            border: Border.all(
                              color: selected
                                  ? AppColors.primary
                                  : AppColors.border,
                            ),
                          ),
                          child: Icon(
                            CategoryIcons.resolve(key),
                            color: selected
                                ? Colors.white
                                : AppColors.neutral,
                            size: 22,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: AppDimensions.space24),
                  PrimaryButton(
                    label: l10n.categorySaveButton,
                    icon: LucideIcons.save,
                    onPressed: _save,
                  ),
                  if (widget.isEditing) ...[
                    const SizedBox(height: AppDimensions.space12),
                    TextButton.icon(
                      onPressed: _requestDelete,
                      icon: const Icon(
                        LucideIcons.trash2,
                        color: AppColors.danger,
                        size: 18,
                      ),
                      label: Text(
                        l10n.btnDelete,
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.danger,
                        ),
                      ),
                    ),
                  ],
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
