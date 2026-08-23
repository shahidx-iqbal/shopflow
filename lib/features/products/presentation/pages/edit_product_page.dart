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
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/layout/page_responsive_body.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../../../categories/domain/usecases/get_categories_usecase.dart';
import '../../domain/entities/product_entity.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../utils/product_barcode_helper.dart';
import '../widgets/product_form_body.dart';

/// Edit product — same form as add, with pre-filled data and read-only stock.
class EditProductPage extends StatefulWidget {
  const EditProductPage({required this.productId, super.key});

  final String productId;

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _barcode = TextEditingController();
  final _price = TextEditingController();
  final _cost = TextEditingController();
  final _stock = TextEditingController();
  final _description = TextEditingController();

  String _unit = 'pcs';
  String? _categoryId;
  List<CategoryEntity> _categories = [];
  String? _imagePath;
  String? _originalBarcode;
  String? _barcodeError;
  bool _filled = false;
  bool _checkingBarcode = false;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final result = await getIt<GetCategoriesUseCase>()(const NoParams());
    result.fold((_) {}, (list) {
      if (!mounted) return;
      setState(() => _categories = list);
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

  void _populateFromProduct(ProductEntity product) {
    _name.text = product.name;
    _barcode.text = product.barcode;
    _price.text = product.price.toString();
    _cost.text = product.costPrice.toString();
    _stock.text = product.stock.toString();
    _unit = product.unit;
    _categoryId = product.categoryId;
    _imagePath = product.imageUrl;
    _originalBarcode = product.barcode;
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

  Future<void> _onBarcodeChanged(String value) async {
    final trimmed = value.trim();
    if (trimmed.isEmpty || trimmed == _originalBarcode) {
      if (_barcodeError != null) {
        setState(() => _barcodeError = null);
      }
      return;
    }

    setState(() {
      _checkingBarcode = true;
      _barcodeError = null;
    });

    final duplicate = await ProductBarcodeHelper.isDuplicate(
      trimmed,
      excludeProductId: widget.productId,
    );

    if (!mounted) return;
    setState(() {
      _checkingBarcode = false;
      _barcodeError = duplicate ? _barcodeExistsMessage(context) : null;
    });
    _formKey.currentState?.validate();
  }

  String _barcodeExistsMessage(BuildContext context) {
    return AppLocalizations.of(context)!.productBarcodeExists;
  }

  Future<bool> _validateBarcodeBeforeSave() async {
    final trimmed = _barcode.text.trim();
    if (trimmed.isEmpty || trimmed == _originalBarcode) {
      return true;
    }

    if (_barcodeError != null) return false;

    final duplicate = await ProductBarcodeHelper.isDuplicate(
      trimmed,
      excludeProductId: widget.productId,
    );

    if (!mounted) return false;
    if (duplicate) {
      setState(
        () => _barcodeError = AppLocalizations.of(context)!.productBarcodeExists,
      );
      _formKey.currentState?.validate();
      return false;
    }
    return true;
  }

  ProductEntity? _buildUpdatedProduct(ProductEntity existing) {
    if (!_formKey.currentState!.validate()) return null;
    if (_categoryId == null || _categoryId!.isEmpty) return null;

    final category = _categories.firstWhere(
      (c) => c.id == _categoryId,
      orElse: () => _categories.firstWhere(
        (c) => c.id == existing.categoryId,
        orElse: () => _categories.first,
      ),
    );

    return existing.copyWith(
      name: _name.text.trim(),
      barcode: _barcode.text.trim(),
      categoryId: _categoryId!,
      categoryName: category.name,
      price: double.parse(_price.text.trim()),
      costPrice: double.parse(_cost.text.trim()),
      unit: _unit,
      imageUrl: _imagePath,
      updatedAt: DateTime.now(),
    );
  }

  Future<void> _submit(
    BuildContext context,
    ProductEntity existing,
  ) async {
    if (_checkingBarcode) return;

    final bloc = context.read<ProductsBloc>();
    final barcodeOk = await _validateBarcodeBeforeSave();
    if (!barcodeOk || !mounted) return;

    final updated = _buildUpdatedProduct(existing);
    if (updated == null) return;

    bloc.add(ProductsUpdateEvent(product: updated));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

    return BlocProvider(
      create: (_) => getIt<ProductsBloc>()
        ..add(ProductsLoadDetailsEvent(id: widget.productId)),
      child: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state.selectedProduct != null && !_filled) {
            _populateFromProduct(state.selectedProduct!);
            _filled = true;
            setState(() {});
          }
          if (state.status == ProductsStatus.success) {
            AppSnackbar.showSuccess(context, l10n.productSaveSuccess);
            context.read<ProductsBloc>().add(const ProductsClearPriceWarningEvent());
            context.pop();
          } else if (state.status == ProductsStatus.error) {
            AppSnackbar.showError(
              context,
              _localizeError(l10n, state),
            );
          }
        },
        builder: (context, state) {
          if (state.selectedProduct == null &&
              state.status == ProductsStatus.loading) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.productsEdit,
                showBackButton: true,
              ),
              body: const LoadingWidget(),
            );
          }

          final product = state.selectedProduct;
          if (product == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.productsEdit,
                showBackButton: true,
              ),
              body: ErrorStateWidget(
                message: state.message ?? l10n.msgSomethingWentWrong,
                retryLabel: l10n.btnRetry,
                onRetry: () => context.read<ProductsBloc>().add(
                      ProductsLoadDetailsEvent(id: widget.productId),
                    ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppTopBar(
              title: l10n.productsEdit,
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
                          isStockReadOnly: true,
                          barcodeError: _barcodeError,
                          onBarcodeChanged: _onBarcodeChanged,
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
                    child: PrimaryButton(
                      label: l10n.productUpdateButton,
                      icon: LucideIcons.check,
                      isLoading: state.status == ProductsStatus.loading ||
                          _checkingBarcode,
                      onPressed: state.status == ProductsStatus.loading ||
                              _checkingBarcode
                          ? null
                          : () => _submit(context, product),
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
