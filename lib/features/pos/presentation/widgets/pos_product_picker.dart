import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/widgets/inputs/app_search_bar.dart';
import '../../../../core/widgets/layout/filter_chip_row.dart';
import '../../../../core/widgets/layout/responsive_grid.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../../../categories/domain/usecases/get_categories_usecase.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../../products/presentation/bloc/products_bloc.dart';
import '../../../products/presentation/bloc/products_event.dart';
import '../../../products/presentation/bloc/products_state.dart';
import '../bloc/pos_bloc.dart';
import '../bloc/pos_event.dart';
import 'pos_product_grid_card.dart';

/// POS product catalog — search, categories, tap for details, add button for cart.
class PosProductPicker extends StatefulWidget {
  const PosProductPicker({super.key});

  @override
  State<PosProductPicker> createState() => _PosProductPickerState();
}

class _PosProductPickerState extends State<PosProductPicker> {
  String? _selectedCategoryId;
  List<CategoryEntity> _categories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final result = await getIt<GetCategoriesUseCase>()(const NoParams());
    result.fold((_) {}, (list) {
      if (mounted) setState(() => _categories = list);
    });
  }

  List<ProductEntity> _posProducts(List<ProductEntity> products) {
    return products.where((p) => p.isActive).toList();
  }

  List<ProductEntity> _filtered(List<ProductEntity> products) {
    if (_selectedCategoryId == null) return products;
    return products
        .where((p) => p.categoryId == _selectedCategoryId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;
    final horizontalPadding = isDesktop
        ? AppDimensions.space24
        : AppDimensions.pagePadding;

    return BlocProvider(
      create: (_) => getIt<ProductsBloc>()..add(const ProductsLoadEvent()),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state.status == ProductsStatus.loading &&
              state.products.isEmpty) {
            return const LoadingWidget();
          }

          if (state.status == ProductsStatus.error &&
              state.products.isEmpty) {
            return ErrorStateWidget(
              message: state.message ?? l10n.msgSomethingWentWrong,
              retryLabel: l10n.btnRetry,
              onRetry: () =>
                  context.read<ProductsBloc>().add(const ProductsLoadEvent()),
            );
          }

          final products = _filtered(_posProducts(state.products));

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    AppDimensions.space16,
                    horizontalPadding,
                    AppDimensions.space12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.posSearchProduct,
                        style: AppTextStyles.labelLarge,
                      ),
                      const SizedBox(height: AppDimensions.space12),
                      Row(
                        children: [
                          Expanded(
                            child: AppSearchBar(
                              hint: l10n.posSearchProduct,
                              onChanged: (q) => context.read<ProductsBloc>().add(
                                    ProductsLoadEvent(query: q),
                                  ),
                            ),
                          ),
                          const SizedBox(width: AppDimensions.space8),
                          Material(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMedium,
                            ),
                            child: InkWell(
                              onTap: () async {
                                final code = await context.push<String>(
                                  RouteNames.barcodeScanner,
                                );
                                if (code != null && context.mounted) {
                                  context.read<PosBloc>().add(
                                        PosScanBarcodeEvent(barcode: code),
                                      );
                                }
                              },
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusMedium,
                              ),
                              child: const SizedBox(
                                width: 48,
                                height: 48,
                                child: Icon(
                                  LucideIcons.scanBarcode,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppDimensions.space12),
                      FilterChipRow(
                        children: [
                          AppFilterChip(
                            label: l10n.filterAll,
                            selected: _selectedCategoryId == null,
                            onTap: () =>
                                setState(() => _selectedCategoryId = null),
                          ),
                          ..._categories.map(
                            (category) => AppFilterChip(
                              label: category.name,
                              selected: _selectedCategoryId == category.id,
                              onTap: () => setState(
                                () => _selectedCategoryId = category.id,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (products.isEmpty)
                SliverFillRemaining(
                  child: EmptyStateWidget(
                    icon: LucideIcons.searchX,
                    title: l10n.productsSearchEmptyTitle,
                    subtitle: l10n.productsSearchEmptySubtitle,
                  ),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    0,
                    horizontalPadding,
                    AppDimensions.space16,
                  ),
                  sliver: SliverGrid(
                    gridDelegate: ResponsiveGrid.productCatalog(),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = products[index];
                        return PosProductGridCard(
                          product: product,
                          onAddToCart: () => context.read<PosBloc>().add(
                                PosAddToCartEvent(product: product),
                              ),
                        );
                      },
                      childCount: products.length,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
