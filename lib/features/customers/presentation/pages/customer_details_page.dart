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
import '../../../customers/domain/entities/customer_entity.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../ledger/presentation/widgets/record_payment_sheet.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../ledger/domain/entities/ledger_entry_entity.dart';
import '../../../ledger/presentation/bloc/ledger_bloc.dart';
import '../../../ledger/presentation/bloc/ledger_event.dart';
import '../../../ledger/presentation/bloc/ledger_state.dart';
import '../widgets/customer_activity_tile.dart';
import '../widgets/customer_avatar.dart';
import '../widgets/customer_balance_overview.dart';
import '../widgets/customer_responsive_body.dart';

/// Customer profile with ledger tabs, history, and record payment.
class CustomerDetailsPage extends StatelessWidget {
  const CustomerDetailsPage({required this.customerId, super.key});

  final String customerId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LedgerBloc>()
        ..add(LedgerLoadStatementEvent(customerId: customerId)),
      child: const _CustomerDetailsView(),
    );
  }
}

class _CustomerDetailsView extends StatelessWidget {
  const _CustomerDetailsView();

  Future<void> _openRecordPayment(
    BuildContext context,
    CustomerEntity customer,
    double balance,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final ledgerBloc = context.read<LedgerBloc>();

    final recorded = await RecordPaymentSheet.show(
      context,
      customer: customer,
      balance: balance,
      ledgerBloc: ledgerBloc,
    );

    if (!context.mounted) return;

    if (recorded) {
      AppSnackbar.showSuccess(context, l10n.ledgerPaymentSuccess);
      context.push(RouteNames.ledgerStatementPath(customer.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 3,
      child: BlocBuilder<LedgerBloc, LedgerState>(
        builder: (context, state) {
          if (state.status == LedgerStatus.loading && state.statement == null) {
            return Scaffold(
            appBar: AppTopBar(
              title: l10n.customersDetails,
              showBackButton: true,
            ),
            body: const LoadingWidget(),
          );
          }
          if (state.status == LedgerStatus.error && state.statement == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.customersDetails,
                showBackButton: true,
              ),
              body: ErrorStateWidget(
                message: state.message ?? l10n.msgSomethingWentWrong,
                retryLabel: l10n.btnRetry,
                onRetry: () {
                  final id = GoRouterState.of(context).pathParameters['id'];
                  if (id != null) {
                    context.read<LedgerBloc>().add(
                          LedgerLoadStatementEvent(customerId: id),
                        );
                  }
                },
              ),
            );
          }

          final statement = state.statement;
          if (statement == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.customersDetails,
                showBackButton: true,
              ),
              body: EmptyStateWidget(
                icon: LucideIcons.scrollText,
                title: l10n.ledgerStatementEmptyTitle,
                subtitle: l10n.ledgerStatementEmptySubtitle,
              ),
            );
          }

          final customer = statement.customer;
          final isDesktop =
              MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppTopBar(
              title: l10n.customersDetails,
              showBackButton: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: CustomerResponsiveBody(
                      includeBottomInset: false,
                      maxWidth: isDesktop ? 880 : 960,
                      child: Column(
                        children: [
                          CustomerAvatar(name: customer.name, radius: 40),
                          const SizedBox(height: AppDimensions.space12),
                          Text(
                            customer.name,
                            style: AppTextStyles.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppDimensions.space4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                LucideIcons.phone,
                                size: 16,
                                color: AppColors.neutral,
                              ),
                              const SizedBox(width: AppDimensions.space4),
                              Text(
                                customer.phone,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.neutral,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppDimensions.space24),
                          CustomerBalanceOverview(balance: statement.balance),
                          const SizedBox(height: AppDimensions.space24),
                          TabBar(
                            labelColor: AppColors.primary,
                            unselectedLabelColor: AppColors.neutral,
                            indicatorColor: AppColors.primary,
                            labelStyle: AppTextStyles.labelMedium.copyWith(
                              letterSpacing: 0.6,
                            ),
                            tabs: [
                              Tab(text: l10n.customerTabHistory.toUpperCase()),
                              Tab(text: l10n.customerTabPayments.toUpperCase()),
                              Tab(text: l10n.customerTabNotes.toUpperCase()),
                            ],
                          ),
                          const SizedBox(height: AppDimensions.space16),
                          SizedBox(
                            height: isDesktop ? 420 : 360,
                            child: TabBarView(
                              children: [
                                _EntriesList(
                                  entries: statement.entries,
                                  emptyMessage: l10n.ledgerNoEntries,
                                ),
                                _EntriesList(
                                  entries: statement.entries
                                      .where(
                                        (e) =>
                                            e.type == LedgerEntryType.credit,
                                      )
                                      .toList(),
                                  emptyMessage: l10n.customerNoPayments,
                                ),
                                _NotesTab(notes: customer.notes),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      isDesktop
                          ? AppDimensions.space32
                          : AppDimensions.pagePadding,
                      AppDimensions.space12,
                      isDesktop
                          ? AppDimensions.space32
                          : AppDimensions.pagePadding,
                      AppDimensions.space16,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isDesktop ? 880 : double.infinity,
                        ),
                        child: PrimaryButton(
                          label: l10n.ledgerRecordPayment,
                          icon: LucideIcons.plus,
                          onPressed: () => _openRecordPayment(
                            context,
                            customer,
                            statement.balance,
                          ),
                        ),
                      ),
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

class _EntriesList extends StatelessWidget {
  const _EntriesList({
    required this.entries,
    required this.emptyMessage,
  });

  final List<LedgerEntryEntity> entries;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return Center(child: Text(emptyMessage, style: AppTextStyles.bodyMedium));
    }

    final sorted = [...entries]
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return ListView.separated(
      itemCount: sorted.length,
      separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.border),
      itemBuilder: (_, i) => CustomerActivityTile(entry: sorted[i]),
    );
  }
}

class _NotesTab extends StatelessWidget {
  const _NotesTab({this.notes});

  final String? notes;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (notes == null || notes!.trim().isEmpty) {
      return Center(
        child: Text(
          l10n.customerNoNotes,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.neutral),
        ),
      );
    }
    return SingleChildScrollView(
      child: Text(notes!, style: AppTextStyles.bodyMedium),
    );
  }
}
