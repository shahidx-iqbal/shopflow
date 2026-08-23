import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/dialogs/app_dialog.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/layout/responsive_grid.dart';
import '../../../../core/widgets/layout/shell_layout.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../products/presentation/widgets/product_integrity_widgets.dart';
import '../../domain/entities/category_entity.dart';
import '../cubit/categories_cubit.dart';
import '../widgets/category_card.dart';
import '../widgets/category_form_sheet.dart';

/// Categories grid with add/edit/delete against `GET/POST/PUT/DELETE /categories`.
class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoriesCubit>()..loadCategories(),
      child: const _CategoryListView(),
    );
  }
}

class _CategoryListView extends StatelessWidget {
  const _CategoryListView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(
        title: l10n.categoriesTitle,
        showBackButton: true,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.plus),
            tooltip: l10n.categoriesAdd,
            onPressed: () => _openForm(context),
          ),
        ],
      ),
      body: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          if (state.status == CategoriesStatus.success) {
            AppSnackbar.showSuccess(context, l10n.categorySaveSuccess);
          } else if (state.status == CategoriesStatus.deleted) {
            AppSnackbar.showSuccess(context, l10n.categoryDeleteSuccess);
          } else if (state.status == CategoriesStatus.error &&
              state.categories.isNotEmpty) {
            AppSnackbar.showError(
              context,
              state.message ?? l10n.msgSomethingWentWrong,
            );
          }
        },
        builder: (context, state) {
          if (state.status == CategoriesStatus.loading &&
              state.categories.isEmpty) {
            return const LoadingWidget();
          }
          if (state.status == CategoriesStatus.error &&
              state.categories.isEmpty) {
            return ErrorStateWidget(
              message: state.message ?? l10n.msgSomethingWentWrong,
              retryLabel: l10n.btnRetry,
              onRetry: () => context.read<CategoriesCubit>().loadCategories(),
            );
          }
          if (state.categories.isEmpty) {
            return EmptyStateWidget(
              icon: LucideIcons.layoutGrid,
              iconBackgroundColor: AppColors.border,
              iconColor: AppColors.neutral,
              title: l10n.categoriesEmptyTitle,
              subtitle: l10n.categoriesEmptySubtitle,
              actionLabel: l10n.categoriesAdd,
              actionIcon: LucideIcons.plus,
              onActionPressed: () => _openForm(context),
            );
          }
          final isDesktop =
              MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimensions.pagePadding,
                    AppDimensions.space8,
                    AppDimensions.pagePadding,
                    AppDimensions.space16,
                  ),
                  child: Text(
                    l10n.categoriesSubtitle,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.neutral,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  isDesktop
                      ? AppDimensions.space32
                      : AppDimensions.pagePadding,
                  0,
                  isDesktop
                      ? AppDimensions.space32
                      : AppDimensions.pagePadding,
                  ShellLayout.detailContentBottomPadding(context),
                ),
                sliver: SliverGrid(
                  gridDelegate: ResponsiveGrid.categories(),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final category = state.categories[index];
                      return CategoryCard(
                        category: category,
                        onTap: () => _openForm(context, category: category),
                        onEdit: () => _openForm(context, category: category),
                        onDelete: () => _confirmDelete(context, category),
                      );
                    },
                    childCount: state.categories.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _openForm(
    BuildContext context, {
    CategoryEntity? category,
  }) async {
    final result = await CategoryFormSheet.show(context, category: category);
    if (result == null || !context.mounted) return;

    if (result.delete && category != null) {
      await _confirmDelete(context, category);
      return;
    }
    if (result.name == null || result.icon == null) return;

    final cubit = context.read<CategoriesCubit>();
    if (category == null) {
      await cubit.addCategory(
        CategoryEntity(id: '', name: result.name!, icon: result.icon!),
      );
    } else {
      await cubit.updateCategory(
        category.copyWith(name: result.name!, icon: result.icon!),
      );
    }
  }

  Future<void> _confirmDelete(
    BuildContext context,
    CategoryEntity category,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await AppDialog.showDelete(
      context: context,
      title: l10n.categoryDeleteConfirm,
      message: l10n.dialogDeleteMessage,
      confirmLabel: l10n.btnDelete,
      cancelLabel: l10n.btnCancel,
    );
    if (confirmed == true && context.mounted) {
      await _deleteCategory(context, category);
    }
  }

  Future<void> _deleteCategory(
    BuildContext context,
    CategoryEntity category,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final cubit = context.read<CategoriesCubit>();
    final products = await cubit.productsInCategory(category.id);

    if (!context.mounted) return;

    if (products.isNotEmpty) {
      final otherCategories = cubit.state.categories
          .where((c) => c.id != category.id)
          .toList();

      if (otherCategories.isEmpty) {
        await AppDialog.showConfirm(
          context: context,
          title: l10n.categoryDeleteBlockedTitle,
          message: l10n.categoryDeleteNoTargetMessage(category.name),
          confirmLabel: l10n.dialogDismiss,
          cancelLabel: l10n.btnCancel,
        );
        return;
      }

      final targetId = await CategoryReassignDialog.show(
        context,
        category: category,
        productCount: products.length,
        otherCategories: otherCategories,
      );

      if (targetId != null && context.mounted) {
        await cubit.reassignProductsAndDelete(
          fromCategoryId: category.id,
          toCategoryId: targetId,
        );
      }
      return;
    }

    await cubit.deleteCategory(category.id);
  }
}
