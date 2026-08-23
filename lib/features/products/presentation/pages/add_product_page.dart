import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/buttons/outlined_button_widget.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/layout/page_responsive_body.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../../../categories/domain/usecases/get_categories_usecase.dart';
import '../../domain/entities/product_entity.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../utils/product_unit_options.dart';
import '../widgets/product_form_body.dart';

/// Add product form — photo, pricing, barcode, stock, category, and actions.
class AddProductPage extends StatefulWidget {
  const AddProductPage({this.initialBarcode, super.key});

  /// Pre-fills the barcode field when opened from POS scan-not-found flow.
  final String? initialBarcode;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _barcode = TextEditingController();
  final _price = TextEditingController();
  final _cost = TextEditingController();
  final _stock = TextEditingController();
  final _description = TextEditingController();

  String _unit = ProductUnitOption.options.first.value;
  String? _categoryId;
  List<CategoryEntity> _categories = [];
  bool _saveAndAddAnother = false;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    final barcode = widget.initialBarcode?.trim();
    if (barcode != null && barcode.isNotEmpty) {
      _barcode.text = barcode;
    }
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final result = await getIt<GetCategoriesUseCase>()(const NoParams());
    result.fold((_) {}, (list) {
      if (!mounted) return;
      setState(() {
        _categories = list;
        if (_categoryId == null && list.isNotEmpty) {
          _categoryId = list.first.id;
        }
      });
    });
  }

  @override
  void dispose() {
    _name.dispose();
    _barcode.dispose();
    _price.dispose();
    _cost.dispose();
    _stock.dispose();
    _description.dispose();
    super.dispose();
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _name.clear();
    _barcode.clear();
    _price.clear();
    _cost.clear();
    _stock.clear();
    _description.clear();
    setState(() {
      _imagePath = null;
      _unit = ProductUnitOption.options.first.value;
      if (_categories.isNotEmpty) {
        _categoryId = _categories.first.id;
      }
    });
  }

  ProductEntity? _buildProduct() {
    if (!_formKey.currentState!.validate()) return null;
    if (_categoryId == null || _categoryId!.isEmpty) return null;

    final category = _categories.firstWhere(
      (c) => c.id == _categoryId,
      orElse: () => _categories.first,
    );
    final now = DateTime.now();

    return ProductEntity(
      id: '',
      name: _name.text.trim(),
      barcode: _barcode.text.trim(),
      categoryId: _categoryId!,
      categoryName: category.name,
      price: double.parse(_price.text.trim()),
      costPrice: double.parse(_cost.text.trim()),
      stock: int.parse(_stock.text.trim()),
      lowStockThreshold: 5,
      unit: _unit,
      imageUrl: _imagePath,
      createdAt: now,
      updatedAt: now,
    );
  }

  bool get _priceBelowCost {
    final price = double.tryParse(_price.text.trim());
    final cost = double.tryParse(_cost.text.trim());
    if (price == null || cost == null) return false;
    return price < cost;
  }

  String _localizeError(AppLocalizations l10n, ProductsState state) {
    switch (state.errorCode) {
      case 'barcode_exists':
        return l10n.productBarcodeExists;
      default:
        return state.message ?? l10n.msgSomethingWentWrong;
    }
  }

  void _submit(BuildContext context, {required bool addAnother}) {
    final product = _buildProduct();
    if (product == null) return;
    setState(() => _saveAndAddAnother = addAnother);
    context.read<ProductsBloc>().add(ProductsAddEvent(product: product));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

    return BlocProvider(
      create: (_) => getIt<ProductsBloc>(),
      child: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state.status == ProductsStatus.success) {
            AppSnackbar.showSuccess(context, l10n.productSaveSuccess);
            context.read<ProductsBloc>().add(const ProductsClearPriceWarningEvent());
            if (_saveAndAddAnother) {
              _resetForm();
              setState(() => _saveAndAddAnother = false);
            } else {
              context.pop();
            }
          } else if (state.status == ProductsStatus.error) {
            AppSnackbar.showError(
              context,
              _localizeError(l10n, state),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppTopBar(
              title: l10n.productsAddNew,
              showBackButton: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: PageResponsiveBody(
                      maxWidth: isDesktop ? 760 : 720,
                      child: AppCard(
                        padding: const EdgeInsets.all(AppDimensions.space20),
                        child: ProductFormBody(
                          formKey: _formKey,
                          nameController: _name,
                          barcodeController: _barcode,
                          priceController: _price,
                          costController: _cost,
                          stockController: _stock,
                          descriptionController: _description,
                          unit: _unit,
                          categoryId: _categoryId,
                          categories: _categories,
                          imagePath: _imagePath,
                          onUnitChanged: (value) =>
                              setState(() => _unit = value),
                          onCategoryChanged: (value) =>
                              setState(() => _categoryId = value),
                          onImageChanged: (path) =>
                              setState(() => _imagePath = path),
                          onPriceOrCostChanged: () => setState(() {}),
                          priceBelowCost: _priceBelowCost,
                          showPriceWarning: state.priceBelowCostWarning,
                        ),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  child: PageResponsiveBody(
                    maxWidth: isDesktop ? 760 : 720,
                    child: Column(
                      children: [
                        PrimaryButton(
                          label: l10n.productSaveButton,
                          icon: LucideIcons.check,
                          isLoading: state.status == ProductsStatus.loading &&
                              !_saveAndAddAnother,
                          onPressed: state.status == ProductsStatus.loading
                              ? null
                              : () => _submit(context, addAnother: false),
                        ),
                        const SizedBox(height: AppDimensions.space12),
                        OutlinedButtonWidget(
                          label: l10n.productSaveAndAddAnother,
                          icon: LucideIcons.plus,
                          textColor: AppColors.secondary,
                          borderColor: AppColors.secondary,
                          isLoading: state.status == ProductsStatus.loading &&
                              _saveAndAddAnother,
                          onPressed: state.status == ProductsStatus.loading
                              ? null
                              : () => _submit(context, addAnother: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
