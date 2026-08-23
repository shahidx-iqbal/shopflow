import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/app_dialog.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/inputs/app_search_bar.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/customer_entity.dart';
import '../bloc/customers_bloc.dart';
import '../bloc/customers_event.dart';
import '../bloc/customers_state.dart';
import '../widgets/customer_card.dart';
import '../widgets/customer_responsive_body.dart';
import '../../../../core/widgets/layout/responsive_grid.dart';
import '../../../../core/widgets/layout/shell_layout.dart';

/// Customers directory — responsive list with search and add flow.
class CustomerListPage extends StatelessWidget {
  const CustomerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => getIt<CustomersBloc>()..add(const CustomersLoadEvent()),
      child: BlocListener<CustomersBloc, CustomersState>(
        listener: (context, state) {
          if (state.status == CustomersStatus.deleted) {
            AppSnackbar.showSuccess(context, l10n.customerDeleteSuccess);
          } else if (state.status == CustomersStatus.error &&
              state.customers.isNotEmpty) {
            AppSnackbar.showError(
              context,
              state.message ?? l10n.msgSomethingWentWrong,
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppTopBar(
            title: l10n.customersTitle,
            showBackButton: true,
          ),
          body: BlocBuilder<CustomersBloc, CustomersState>(
            builder: (context, state) {
              if (state.status == CustomersStatus.loading &&
                  state.customers.isEmpty) {
                return const LoadingWidget();
              }
              if (state.status == CustomersStatus.error &&
                  state.customers.isEmpty) {
                return ErrorStateWidget(
                  message: state.message ?? l10n.msgSomethingWentWrong,
                  retryLabel: l10n.btnRetry,
                  onRetry: () =>
                      context.read<CustomersBloc>().add(const CustomersLoadEvent()),
                );
              }
              return _CustomerListBody(state: state);
            },
          ),
        ),
      ),
    );
  }
}

class _CustomerListBody extends StatelessWidget {
  const _CustomerListBody({required this.state});

  final CustomersState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

    if (state.customers.isEmpty) {
      return CustomerResponsiveBody(
        child: EmptyStateWidget(
          icon: LucideIcons.userPlus,
          iconBackgroundColor: AppColors.border,
          iconColor: AppColors.neutral,
          title: l10n.customersEmptyTitle,
          subtitle: l10n.customersEmptySubtitle,
          actionLabel: l10n.customersAdd,
          actionIcon: LucideIcons.userPlus,
          onActionPressed: () => _openAdd(context),
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomerResponsiveBody(
            includeBottomInset: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.customersTitle,
                              style: AppTextStyles.headlineLarge,
                            ),
                            const SizedBox(height: AppDimensions.space4),
                            Text(
                              l10n.customersSubtitle,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.neutral,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: PrimaryButton(
                          label: l10n.customersAdd,
                          icon: LucideIcons.userPlus,
                          onPressed: () => _openAdd(context),
                        ),
                      ),
                    ],
                  )
                else ...[
                  Text(
                    l10n.customersSubtitle,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.neutral,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.space16),
                  PrimaryButton(
                    label: l10n.customersAdd,
                    icon: LucideIcons.userPlus,
                    onPressed: () => _openAdd(context),
                  ),
                ],
                const SizedBox(height: AppDimensions.space16),
                AppSearchBar(
                  hint: l10n.customersSearchHint,
                  onChanged: (q) => context
                      .read<CustomersBloc>()
                      .add(CustomersLoadEvent(query: q)),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            isDesktop ? AppDimensions.space32 : AppDimensions.pagePadding,
            AppDimensions.space16,
            isDesktop ? AppDimensions.space32 : AppDimensions.pagePadding,
            isDesktop
                ? AppDimensions.space32
                : ShellLayout.tabContentBottomPadding(context),
          ),
          sliver: SliverGrid(
            gridDelegate: ResponsiveGrid.customers(),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final customer = state.customers[index];
                return CustomerCard(
                  customer: customer,
                  onTap: () => _openDetails(context, customer.id),
                  onEdit: () => _openEdit(context, customer),
                  onDelete: () => _confirmDelete(context, customer),
                );
              },
              childCount: state.customers.length,
            ),
          ),
        ),
      ],
    );
  }

  void _openAdd(BuildContext context) {
    context.push(RouteNames.addCustomer);
  }

  void _openEdit(BuildContext context, CustomerEntity customer) {
    context.push(RouteNames.addCustomer, extra: customer);
  }

  void _openDetails(BuildContext context, String id) {
    context.push(RouteNames.customerDetailsPath(id));
  }

  Future<void> _confirmDelete(
    BuildContext context,
    CustomerEntity customer,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await AppDialog.showDelete(
      context: context,
      title: l10n.dialogDeleteTitle,
      message: l10n.customerDeleteConfirm,
      confirmLabel: l10n.btnDelete,
      cancelLabel: l10n.btnCancel,
    );
    if (confirmed == true && context.mounted) {
      context.read<CustomersBloc>().add(CustomersDeleteEvent(id: customer.id));
    }
  }
}
