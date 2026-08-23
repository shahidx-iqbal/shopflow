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
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/buttons/outlined_button_widget.dart';
import '../../../../core/widgets/inputs/app_search_bar.dart';
import '../../../../core/widgets/layout/filter_chip_row.dart';
import '../../../../core/widgets/layout/responsive_grid.dart';
import '../../../../core/widgets/layout/shell_layout.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../categories/domain/entities/category_entity.dart';
import '../../../categories/domain/usecases/get_categories_usecase.dart';
import '../../domain/entities/product_entity.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../utils/product_stock_helper.dart';
import 'product_grid_card.dart';

enum ProductStockFilter { all, lowStock, outOfStock }

/// Shared product catalog — search, category chips, grid, and load more.
class ProductCatalogScaffold extends StatefulWidget {
  const ProductCatalogScaffold({
    required this.title,
    this.subtitle,
    this.includeBottomInset = false,
    this.showStockFilters = false,
    super.key,
  });

  final String title;
  final String? subtitle;
  final bool includeBottomInset;
  final bool showStockFilters;

  @override
  State<ProductCatalogScaffold> createState() => _ProductCatalogScaffoldState();
}

class _ProductCatalogScaffoldState extends State<ProductCatalogScaffold> {
  static const _pageSize = 4;

  String? _selectedCategoryId;
  int _visibleCount = _pageSize;
  List<CategoryEntity> _categories = [];
  ProductStockFilter _stockFilter = ProductStockFilter.all;
  String _searchQuery = '';

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

  List<ProductEntity> _filteredProducts(List<ProductEntity> products) {
    var result = products;
    if (_selectedCategoryId != null) {
      result = result.where((p) => p.categoryId == _selectedCategoryId).toList();
    }
    result = switch (_stockFilter) {
      ProductStockFilter.all => result,
      ProductStockFilter.lowStock => result
          .where((p) => ProductStockHelper.status(p) == ProductStockStatus.lowStock)
          .toList(),
      ProductStockFilter.outOfStock => result
          .where((p) => ProductStockHelper.status(p) == ProductStockStatus.outOfStock)
          .toList(),
    };
    return result;
  }

  Widget _buildEmptyState(
    BuildContext context,
    ProductsState state,
  ) {
    final l10n = AppLocalizations.of(context)!;

    if (state.products.isEmpty) {
      return EmptyStateWidget(
        icon: LucideIcons.package,
        iconBackgroundColor: AppColors.border,
        iconColor: AppColors.neutral,
        title: l10n.inventoryEmptyTitle,
        subtitle: l10n.inventoryEmptySubtitle,
        actionLabel: l10n.inventoryEmptyAction,
        actionIcon: LucideIcons.plus,
        onActionPressed: () => context.push(RouteNames.addProduct),
      );
    }

    if (_searchQuery.isNotEmpty) {
      return EmptyStateWidget(
        icon: LucideIcons.searchX,
        title: l10n.productsSearchEmptyTitle,
        subtitle: l10n.productsSearchEmptySubtitle,
      );
    }

    if (_stockFilter == ProductStockFilter.lowStock) {
      return EmptyStateWidget(
        icon: LucideIcons.circleCheck,
        iconBackgroundColor: AppColors.primaryLight,
        iconColor: AppColors.primary,
        title: l10n.inventoryLowStockEmptyTitle,
        subtitle: l10n.inventoryLowStockEmptySubtitle,
      );
    }

    if (_stockFilter == ProductStockFilter.outOfStock) {
      return EmptyStateWidget(
        icon: LucideIcons.packageCheck,
        iconBackgroundColor: AppColors.primaryLight,
        iconColor: AppColors.primary,
        title: l10n.inventoryOutOfStockEmptyTitle,
        subtitle: l10n.inventoryOutOfStockEmptySubtitle,
      );
    }

    return EmptyStateWidget(
      icon: LucideIcons.searchX,
      title: l10n.productsSearchEmptyTitle,
      subtitle: l10n.productsSearchEmptySubtitle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;
    final horizontalPadding = isDesktop
        ? AppDimensions.space32
        : AppDimensions.pagePadding;

    return BlocProvider(
      create: (_) => getIt<ProductsBloc>()..add(const ProductsLoadEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppTopBar(
          title: widget.title,
          actions: [
            IconButton(
              icon: const Icon(LucideIcons.plus),
              tooltip: l10n.productsAdd,
              onPressed: () => context.push(RouteNames.addProduct),
            ),
          ],
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
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

            final filtered = _filteredProducts(state.products);
            final visible = filtered.take(_visibleCount).toList();
            final hasMore = filtered.length > _visibleCount;

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      isDesktop
                          ? AppDimensions.space24
                          : AppDimensions.space16,
                      horizontalPadding,
                      AppDimensions.space16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (widget.subtitle != null) ...[
                          Text(
                            widget.subtitle!,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.neutral,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.space16),
                        ],
                        Row(
                          children: [
                            Expanded(
                              child: AppSearchBar(
                                hint: l10n.productsSearchHint,
                                onChanged: (q) {
                                  setState(() => _searchQuery = q);
                                  context.read<ProductsBloc>().add(
                                        ProductsLoadEvent(query: q),
                                      );
                                },
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
                                    context.read<ProductsBloc>().add(
                                          ProductsLoadEvent(query: code),
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
                        if (widget.showStockFilters) ...[
                          const SizedBox(height: AppDimensions.space16),
                          FilterChipRow(
                            children: [
                              AppFilterChip(
                                label: l10n.inventoryFilterAll,
                                selected:
                                    _stockFilter == ProductStockFilter.all,
                                onTap: () => setState(() {
                                  _stockFilter = ProductStockFilter.all;
                                  _visibleCount = _pageSize;
                                }),
                              ),
                              AppFilterChip(
                                label: l10n.inventoryFilterLowStock,
                                selected: _stockFilter ==
                                    ProductStockFilter.lowStock,
                                onTap: () => setState(() {
                                  _stockFilter = ProductStockFilter.lowStock;
                                  _visibleCount = _pageSize;
                                }),
                              ),
                              AppFilterChip(
                                label: l10n.inventoryFilterOutOfStock,
                                selected: _stockFilter ==
                                    ProductStockFilter.outOfStock,
                                onTap: () => setState(() {
                                  _stockFilter =
                                      ProductStockFilter.outOfStock;
                                  _visibleCount = _pageSize;
                                }),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: AppDimensions.space12),
                        FilterChipRow(
                          children: [
                            AppFilterChip(
                              label: l10n.filterAll,
                              selected: _selectedCategoryId == null,
                              onTap: () => setState(() {
                                _selectedCategoryId = null;
                                _visibleCount = _pageSize;
                              }),
                            ),
                            ..._categories.map(
                              (category) => AppFilterChip(
                                label: category.name,
                                selected:
                                    _selectedCategoryId == category.id,
                                onTap: () => setState(() {
                                  _selectedCategoryId = category.id;
                                  _visibleCount = _pageSize;
                                }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (filtered.isEmpty)
                  SliverFillRemaining(
                    child: _buildEmptyState(context, state),
                  )
                else
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      AppDimensions.space16,
                      horizontalPadding,
                      widget.includeBottomInset
                          ? ShellLayout.tabContentBottomPadding(context)
                          : AppDimensions.space16,
                    ),
                    sliver: SliverGrid(
                      gridDelegate: ResponsiveGrid.productCatalog(),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final product = visible[index];
                          return ProductGridCard(
                            product: product,
                            onTap: () => context.push(
                              RouteNames.productDetailsPath(product.id),
                            ),
                          );
                        },
                        childCount: visible.length,
                      ),
                    ),
                  ),
                if (hasMore)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppDimensions.pagePadding,
                        0,
                        AppDimensions.pagePadding,
                        AppDimensions.space24,
                      ),
                      child: OutlinedButtonWidget(
                        label: l10n.loadMoreProducts,
                        icon: LucideIcons.refreshCw,
                        onPressed: () => setState(
                          () => _visibleCount += _pageSize,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
