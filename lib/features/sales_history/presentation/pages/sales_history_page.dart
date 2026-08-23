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
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/inputs/app_search_bar.dart';
import '../../../../core/widgets/layout/shell_layout.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../bloc/sales_history_bloc.dart';
import '../bloc/sales_history_event.dart';
import '../bloc/sales_history_state.dart';
import '../widgets/sale_history_card.dart';
import '../widgets/sale_type_filter_bar.dart';
import '../widgets/sales_history_summary_bar.dart';

/// Sales tab — responsive list of cash and ledger transactions with filters.
class SalesHistoryPage extends StatefulWidget {
  const SalesHistoryPage({super.key});

  @override
  State<SalesHistoryPage> createState() => _SalesHistoryPageState();
}

class _SalesHistoryPageState extends State<SalesHistoryPage> {
  String _searchQuery = '';

  List<SaleEntity> _filterSales(List<SaleEntity> sales) {
    if (_searchQuery.isEmpty) return sales;
    final q = _searchQuery.toLowerCase();
    return sales.where((s) {
      return s.id.toLowerCase().contains(q) ||
          s.items.any((i) => i.productName.toLowerCase().contains(q));
    }).toList();
  }

  Widget _buildEmptyState(
    BuildContext context,
    SalesHistoryState state,
  ) {
    final l10n = AppLocalizations.of(context)!;

    if (_searchQuery.isNotEmpty) {
      return EmptyStateWidget(
        icon: LucideIcons.receipt,
        title: l10n.salesHistorySearchEmptyTitle,
        subtitle: l10n.salesHistorySearchEmptySubtitle,
      );
    }

    if (state.filter != null) {
      return EmptyStateWidget(
        icon: LucideIcons.filterX,
        title: l10n.salesHistoryFilterEmptyTitle,
        subtitle: l10n.salesHistoryFilterEmptySubtitle,
      );
    }

    return EmptyStateWidget(
      icon: LucideIcons.store,
      iconBackgroundColor: AppColors.border,
      iconColor: AppColors.neutral,
      title: l10n.salesHistoryEmptyTitle,
      subtitle: l10n.salesHistoryEmptySubtitle,
      actionLabel: l10n.salesHistoryEmptyAction,
      actionIcon: LucideIcons.shoppingCart,
      onActionPressed: () => context.push(RouteNames.posCheckout),
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
      create: (_) =>
          getIt<SalesHistoryBloc>()..add(const SalesHistoryLoadEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppTopBar(title: l10n.salesHistoryTitle),
        body: BlocBuilder<SalesHistoryBloc, SalesHistoryState>(
          builder: (context, state) {
            if (state.status == SalesHistoryStatus.loading &&
                state.sales.isEmpty) {
              return const LoadingWidget();
            }
            if (state.status == SalesHistoryStatus.error &&
                state.sales.isEmpty) {
              return ErrorStateWidget(
                message: state.message ?? l10n.msgSomethingWentWrong,
                retryLabel: l10n.btnRetry,
                onRetry: () => context.read<SalesHistoryBloc>().add(
                      SalesHistoryLoadEvent(filter: state.filter),
                    ),
              );
            }

            final displayed = _filterSales(state.sales);

            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 960 : double.infinity,
                ),
                child: CustomScrollView(
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
                            Text(
                              l10n.salesHistorySubtitle,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.neutral,
                              ),
                            ),
                            const SizedBox(height: AppDimensions.space16),
                            AppSearchBar(
                              hint: l10n.salesHistorySearchHint,
                              onChanged: (q) =>
                                  setState(() => _searchQuery = q),
                            ),
                            const SizedBox(height: AppDimensions.space16),
                            SaleTypeFilterBar(
                              selectedFilter: state.filter,
                              onFilterChanged: (filter) {
                                context.read<SalesHistoryBloc>().add(
                                      SalesHistoryLoadEvent(filter: filter),
                                    );
                              },
                            ),
                            if (displayed.isNotEmpty) ...[
                              const SizedBox(height: AppDimensions.space16),
                              SalesHistorySummaryBar(
                                sales: displayed,
                                filter: state.filter,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    if (displayed.isEmpty)
                      SliverFillRemaining(
                        child: _buildEmptyState(context, state),
                      )
                    else
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          AppDimensions.space8,
                          horizontalPadding,
                          ShellLayout.tabContentBottomPadding(context),
                        ),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final sale = displayed[index];
                              return SaleHistoryCard(
                                sale: sale,
                                isDesktop: isDesktop,
                                onTap: () => context.push(
                                  RouteNames.invoiceDetailsPath(sale.id),
                                ),
                              );
                            },
                            childCount: displayed.length,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
