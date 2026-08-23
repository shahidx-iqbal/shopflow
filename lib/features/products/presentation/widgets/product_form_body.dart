import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../core/widgets/layout/page_responsive_body.dart';
import '../../../../core/widgets/media/app_image_picker_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../utils/product_unit_options.dart';
import 'product_integrity_widgets.dart';

/// Shared product form fields used by add and edit product screens.
class ProductFormBody extends StatelessWidget {
  const ProductFormBody({
    required this.formKey,
    required this.nameController,
    required this.barcodeController,
    required this.priceController,
    required this.costController,
    required this.stockController,
    required this.descriptionController,
    required this.unit,
    required this.categoryId,
    required this.categories,
    required this.imagePath,
    required this.onUnitChanged,
    required this.onCategoryChanged,
    required this.onImageChanged,
    required this.onPriceOrCostChanged,
    required this.priceBelowCost,
    required this.showPriceWarning,
    this.isStockReadOnly = false,
    this.barcodeError,
    this.onBarcodeChanged,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController barcodeController;
  final TextEditingController priceController;
  final TextEditingController costController;
  final TextEditingController stockController;
  final TextEditingController descriptionController;
  final String unit;
  final String? categoryId;
  final List<CategoryEntity> categories;
  final String? imagePath;
  final ValueChanged<String> onUnitChanged;
  final ValueChanged<String?> onCategoryChanged;
  final ValueChanged<String?> onImageChanged;
  final VoidCallback onPriceOrCostChanged;
  final bool priceBelowCost;
  final bool showPriceWarning;
  final bool isStockReadOnly;
  final String? barcodeError;
  final ValueChanged<String>? onBarcodeChanged;

  InputDecoration _dropdownDecoration({
    required String label,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: AppColors.neutral, size: 20)
          : null,
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.space16,
        vertical: AppDimensions.space16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    );
  }

  void _generateBarcode() {
    final code =
        '890${DateTime.now().millisecondsSinceEpoch}'.substring(0, 13);
    barcodeController.text = code;
    onBarcodeChanged?.call(code);
  }

  Future<void> _scanBarcode(BuildContext context) async {
    final code = await context.push<String>(RouteNames.barcodeScanner);
    if (code != null) {
      barcodeController.text = code;
      onBarcodeChanged?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (priceBelowCost || showPriceWarning)
            const Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.space16),
              child: PriceBelowCostBanner(),
            ),
          AppImagePickerField(
            imagePath: imagePath,
            onImageChanged: onImageChanged,
          ),
          const SizedBox(height: AppDimensions.space24),
          AppTextField(
            label: l10n.productNameLabel,
            hint: l10n.productNameHint,
            controller: nameController,
            prefixIcon: LucideIcons.tag,
            validator: (value) => Validators.minLength(
              value,
              2,
              requiredMessage: l10n.validationProductNameRequired,
              minLengthMessage: l10n.validationProductNameMinLength,
            ),
          ),
          const SizedBox(height: AppDimensions.space16),
          ResponsiveFormRow(
            children: [
              AppTextField(
                label: l10n.productPriceLabel,
                hint: '0.00',
                controller: priceController,
                prefixIcon: LucideIcons.banknote,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) => Validators.positiveNumber(
                  value,
                  requiredMessage: l10n.validationProductPriceRequired,
                  invalidMessage: l10n.validationProductPriceInvalid,
                ),
                onChanged: (_) => onPriceOrCostChanged(),
              ),
              AppTextField(
                label: l10n.productPurchasePriceLabel,
                hint: '0.00',
                controller: costController,
                prefixIcon: LucideIcons.wallet,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) => Validators.positiveNumber(
                  value,
                  requiredMessage: l10n.validationProductCostRequired,
                  invalidMessage: l10n.validationProductCostInvalid,
                ),
                onChanged: (_) => onPriceOrCostChanged(),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.space16),
          Row(
            children: [
              Text(
                l10n.productBarcodeLabel,
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.neutral,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: _generateBarcode,
                child: Text(
                  l10n.productGenerateQr,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.space8),
          AppTextField(
            label: '',
            hint: l10n.productBarcodeHint,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            controller: barcodeController,
            prefixIcon: LucideIcons.barcode,
            validator: (value) {
              final formatError = Validators.barcode(
                value,
                requiredMessage: l10n.validationProductBarcodeRequired,
                invalidMessage: l10n.validationProductBarcodeInvalid,
              );
              if (formatError != null) return formatError;
              if (barcodeError != null) return barcodeError;
              return null;
            },
            onChanged: onBarcodeChanged,
            suffixIcon: IconButton(
              icon: const Icon(LucideIcons.qrCode),
              color: AppColors.primary,
              onPressed: () => _scanBarcode(context),
            ),
          ),
          const SizedBox(height: AppDimensions.space16),
          ResponsiveFormRow(
            children: [
              AppTextField(
                label: l10n.productStockQuantityLabel,
                hint: '0',
                controller: stockController,
                prefixIcon: LucideIcons.layers,
                keyboardType: TextInputType.number,
                readOnly: isStockReadOnly,
                enabled: !isStockReadOnly,
                validator: isStockReadOnly
                    ? null
                    : (value) => Validators.nonNegativeInteger(
                          value,
                          requiredMessage: l10n.validationProductStockRequired,
                          invalidMessage: l10n.validationProductStockInvalid,
                        ),
              ),
              DropdownButtonFormField<String>(
                key: ValueKey(unit),
                initialValue: unit,
                decoration: _dropdownDecoration(
                  label: l10n.productUnitLabel,
                  prefixIcon: LucideIcons.hourglass,
                ),
                items: ProductUnitOption.options
                    .map(
                      (option) => DropdownMenuItem(
                        value: option.value,
                        child: Text(option.labelKey(l10n)),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) onUnitChanged(value);
                },
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.space16),
          DropdownButtonFormField<String>(
            key: ValueKey(categoryId),
            initialValue: categoryId,
            decoration: _dropdownDecoration(
              label: l10n.productCategoryLabel,
              prefixIcon: LucideIcons.layers2,
            ),
            hint: Text(l10n.productSelectCategory),
            items: categories
                .map(
                  (category) => DropdownMenuItem(
                    value: category.id,
                    child: Text(category.name),
                  ),
                )
                .toList(),
            onChanged: onCategoryChanged,
            validator: (value) =>
                value == null ? l10n.validationProductCategoryRequired : null,
          ),
          const SizedBox(height: AppDimensions.space16),
          AppTextField(
            label: l10n.productDescriptionOptionalLabel,
            hint: l10n.productDescriptionHint,
            controller: descriptionController,
            prefixIcon: LucideIcons.alignLeft,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
