import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/inputs/app_search_bar.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../core/widgets/layout/shell_layout.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../bloc/ledger_bloc.dart';
import '../bloc/ledger_event.dart';
import '../bloc/ledger_state.dart';
import '../widgets/ledger_customer_card.dart';

/// Ledger customers with outstanding balances — card list, tap for statement.
class LedgerListPage extends StatefulWidget {
  const LedgerListPage({super.key});

  @override
  State<LedgerListPage> createState() => _LedgerListPageState();
}

class _LedgerListPageState extends State<LedgerListPage> {
  String _searchQuery = '';

  List<CustomerEntity> _filterCustomers(List<CustomerEntity> customers) {
    if (_searchQuery.isEmpty) return customers;

    final query = _searchQuery.toLowerCase();
    return customers.where((customer) {
      return customer.name.toLowerCase().contains(query) ||
          customer.phone.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => getIt<LedgerBloc>()..add(const LedgerLoadCustomersEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppTopBar(
          title: l10n.ledgerTitle,
          showBackButton: true,
        ),
        body: BlocBuilder<LedgerBloc, LedgerState>(
          builder: (context, state) {
            if (state.status == LedgerStatus.loading) {
              return const LoadingWidget();
            }
            if (state.status == LedgerStatus.error) {
              return ErrorStateWidget(
                message: state.message ?? l10n.msgSomethingWentWrong,
                retryLabel: l10n.btnRetry,
                onRetry: () => context
                    .read<LedgerBloc>()
                    .add(const LedgerLoadCustomersEvent()),
              );
            }
            if (state.customers.isEmpty) {
              return EmptyStateWidget(
                icon: LucideIcons.scale,
                iconBackgroundColor: AppColors.primaryLight,
                iconColor: AppColors.primary,
                title: l10n.ledgerClearTitle,
                subtitle: l10n.ledgerClearSubtitle,
                actionLabel: l10n.ledgerClearAction,
                actionIcon: LucideIcons.chartBar,
                buttonVariant: EmptyStateButtonVariant.outlined,
                onActionPressed: () => context.push(RouteNames.reports),
              );
            }

            final displayed = _filterCustomers(state.customers);

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppDimensions.pagePadding,
                      AppDimensions.space16,
                      AppDimensions.pagePadding,
                      AppDimensions.space12,
                    ),
                    child: AppSearchBar(
                      hint: l10n.ledgerSearchHint,
                      onChanged: (query) =>
                          setState(() => _searchQuery = query.trim()),
                    ),
                  ),
                ),
                if (displayed.isEmpty)
                  SliverFillRemaining(
                    child: EmptyStateWidget(
                      icon: LucideIcons.searchX,
                      title: l10n.ledgerSearchEmptyTitle,
                      subtitle: l10n.ledgerSearchEmptySubtitle,
                    ),
                  )
                else
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      AppDimensions.pagePadding,
                      AppDimensions.space4,
                      AppDimensions.pagePadding,
                      ShellLayout.detailContentBottomPadding(context),
                    ),
                    sliver: SliverList.separated(
                      itemCount: displayed.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: AppDimensions.space12),
                      itemBuilder: (_, index) {
                        final customer = displayed[index];
                        return LedgerCustomerCard(
                          customer: customer,
                          onTap: () => context.push(
                            RouteNames.ledgerStatementPath(customer.id),
                          ),
                        );
                      },
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
