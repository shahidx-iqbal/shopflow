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
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../core/widgets/dialogs/app_dialog.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/layout/page_responsive_body.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/product_entity.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../utils/product_stock_helper.dart';

/// Product detail screen with edit/delete and stock.
/// When [posMode] is true (opened from POS), shows Add to Cart instead of edit actions.
class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    required this.productId,
    this.posMode = false,
    this.onPosAddToCart,
    super.key,
  });

  final String productId;
  final bool posMode;
  final void Function(BuildContext context, ProductEntity product)? onPosAddToCart;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsBloc>()
        ..add(ProductsLoadDetailsEvent(id: productId)),
      child: _ProductDetailsView(
        posMode: posMode,
        onPosAddToCart: onPosAddToCart,
      ),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {
  const _ProductDetailsView({
    this.posMode = false,
    this.onPosAddToCart,
  });

  final bool posMode;
  final void Function(BuildContext context, ProductEntity product)? onPosAddToCart;

  Future<void> _confirmDelete(BuildContext context, ProductEntity product) async {
    final l10n = AppLocalizations.of(context)!;
    final state = context.read<ProductsBloc>().state;
    if (!state.canHardDelete) {
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.productDeleteBlockedTitle),
          content: Text(l10n.productDeleteBlockedMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.btnCancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                _confirmDeactivate(context, product);
              },
              child: Text(l10n.productDeactivate),
            ),
          ],
        ),
      );
      return;
    }

    final confirmed = await AppDialog.showDelete(
      context: context,
      title: l10n.dialogDeleteTitle,
      message: l10n.dialogDeleteMessage,
      confirmLabel: l10n.btnDelete,
      cancelLabel: l10n.btnCancel,
    );
    if (confirmed == true && context.mounted) {
      context.read<ProductsBloc>().add(ProductsDeleteEvent(id: product.id));
    }
  }

  Future<void> _confirmDeactivate(
    BuildContext context,
    ProductEntity product,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await AppDialog.showConfirm(
      context: context,
      title: l10n.productDeactivateTitle,
      message: l10n.productDeactivateMessage,
      confirmLabel: l10n.productDeactivate,
      cancelLabel: l10n.btnCancel,
    );
    if (confirmed == true && context.mounted) {
      context.read<ProductsBloc>().add(ProductsDeactivateEvent(id: product.id));
    }
  }

  String _localizeError(AppLocalizations l10n, String? code, String? message) {
    switch (code) {
      case 'product_has_sales_history':
        return l10n.productDeleteBlockedMessage;
      case 'barcode_exists':
        return l10n.productBarcodeExists;
      default:
        return message ?? l10n.msgSomethingWentWrong;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (state.status == ProductsStatus.deleted) {
          AppSnackbar.showSuccess(context, l10n.productDeleteSuccess);
          context.pop();
        } else if (state.status == ProductsStatus.deactivated) {
          AppSnackbar.showSuccess(context, l10n.productDeactivateSuccess);
        } else if (state.status == ProductsStatus.error) {
          AppSnackbar.showError(
            context,
            _localizeError(l10n, state.errorCode, state.message),
          );
        }
      },
      builder: (context, state) {
        if (state.status == ProductsStatus.loading &&
            state.selectedProduct == null) {
          return Scaffold(
            appBar: AppTopBar(
              title: l10n.productsDetails,
              showBackButton: true,
            ),
            body: const LoadingWidget(),
          );
        }

        final product = state.selectedProduct;
        if (product == null) {
          return Scaffold(
            appBar: AppTopBar(
              title: l10n.productsDetails,
              showBackButton: true,
            ),
            body: ErrorStateWidget(
              message: state.message ?? l10n.msgSomethingWentWrong,
              retryLabel: l10n.btnRetry,
              onRetry: () => context.read<ProductsBloc>().add(
                    ProductsLoadDetailsEvent(
                      id: GoRouterState.of(context).pathParameters['id']!,
                    ),
                  ),
            ),
          );
        }

        final isDesktop =
            MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppTopBar(
            title: l10n.productsDetails,
            showBackButton: true,
            actions: posMode
                ? const []
                : [
                    IconButton(
                      icon: const Icon(LucideIcons.pencil),
                      tooltip: l10n.btnEdit,
                      onPressed: () => context.push(
                        RouteNames.editProductPath(product.id),
                      ),
                    ),
                    if (product.isActive)
                      IconButton(
                        icon: const Icon(LucideIcons.eyeOff),
                        tooltip: l10n.productDeactivate,
                        onPressed: () => _confirmDeactivate(context, product),
                      ),
                    if (state.canHardDelete)
                      IconButton(
                        icon: const Icon(LucideIcons.trash2),
                        tooltip: l10n.btnDelete,
                        onPressed: () => _confirmDelete(context, product),
                      ),
                  ],
          ),
          bottomNavigationBar: posMode
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.pagePadding),
                    child: PrimaryButton(
                      label: l10n.posAddToCart,
                      icon: LucideIcons.plus,
                      onPressed: product.isActive && product.stock > 0
                          ? () {
                              onPosAddToCart?.call(context, product);
                              AppSnackbar.showSuccess(
                                context,
                                l10n.posAddedToCart,
                              );
                              context.pop();
                            }
                          : null,
                    ),
                  ),
                )
              : null,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: AppColors.secondaryLight,
                  child: const Center(
                    child: Icon(
                      LucideIcons.package,
                      size: 72,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: PageResponsiveBody(
                  maxWidth: isDesktop ? 880 : 960,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Wrap(
                        spacing: AppDimensions.space8,
                        runSpacing: AppDimensions.space8,
                        children: [
                          _TagChip(
                            label: product.categoryName ?? l10n.productCategoryLabel,
                            color: AppColors.tertiary,
                            background: AppColors.tertiaryLight,
                          ),
                          _TagChip(
                            label: product.isActive
                                ? l10n.productActive
                                : l10n.productInactive,
                            color: product.isActive
                                ? AppColors.primary
                                : AppColors.neutral,
                            background: product.isActive
                                ? AppColors.primaryLight
                                : AppColors.border,
                            icon: LucideIcons.circle,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppDimensions.space12),
                      Text(product.name, style: AppTextStyles.headlineMedium),
                      const SizedBox(height: AppDimensions.space4),
                      Text(
                        l10n.productSkuLabel(product.barcode),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.neutral,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.space24),
                      _RetailPriceCard(product: product),
                      const SizedBox(height: AppDimensions.space16),
                      _CurrentStockCard(product: product),
                      const SizedBox(height: AppDimensions.space32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({
    required this.label,
    required this.color,
    required this.background,
    this.icon,
  });

  final String label;
  final Color color;
  final Color background;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.space12,
        vertical: AppDimensions.space4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 8, color: color),
            const SizedBox(width: AppDimensions.space4),
          ],
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _RetailPriceCard extends StatelessWidget {
  const _RetailPriceCard({required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppCard(
      color: AppColors.primaryLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.productRetailPrice.toUpperCase(),
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.neutral,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: AppDimensions.space8),
          Text(
            Formatters.currency(product.price),
            style: AppTextStyles.numberLarge.copyWith(
              color: AppColors.primary,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: AppDimensions.space4),
          Text(
            l10n.productCostValue(Formatters.currency(product.costPrice)),
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.neutral,
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentStockCard extends StatelessWidget {
  const _CurrentStockCard({required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final progress = ProductStockHelper.stockProgress(product);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.inventoryCurrentStock,
                  style: AppTextStyles.labelMedium,
                ),
              ),
              const Icon(LucideIcons.box, color: AppColors.neutral, size: 20),
            ],
          ),
          const SizedBox(height: AppDimensions.space12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${product.stock}',
                style: AppTextStyles.numberLarge.copyWith(fontSize: 36),
              ),
              const SizedBox(width: AppDimensions.space8),
              Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.space8),
                child: Text(
                  l10n.productUnits,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.neutral,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.space12),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.border,
              color: product.stock <= product.lowStockThreshold
                  ? AppColors.tertiary
                  : AppColors.primary,
            ),
          ),
          const SizedBox(height: AppDimensions.space8),
          Text(
            l10n.productReorderLevel(product.lowStockThreshold, product.unit),
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
          ),
        ],
      ),
    );
  }
}
