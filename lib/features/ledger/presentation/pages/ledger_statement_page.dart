import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/buttons/outlined_button_widget.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/states/empty_state_widget.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../customers/presentation/widgets/customer_responsive_body.dart';
import '../bloc/ledger_bloc.dart';
import '../bloc/ledger_event.dart';
import '../bloc/ledger_state.dart';
import '../widgets/ledger_statement_entry_row.dart';
import '../widgets/ledger_statement_profile_card.dart';
import '../widgets/record_payment_sheet.dart';

/// Full ledger statement with profile, running balance rows, and share action.
class LedgerStatementPage extends StatefulWidget {
  const LedgerStatementPage({required this.customerId, super.key});

  final String customerId;

  @override
  State<LedgerStatementPage> createState() => _LedgerStatementPageState();
}

class _LedgerStatementPageState extends State<LedgerStatementPage> {
  late String _selectedPeriod;

  @override
  void initState() {
    super.initState();
    _selectedPeriod = LedgerStatementPeriodFilter.monthOptions().first;
  }

  Future<void> _openRecordPayment(
    BuildContext context,
    LedgerBloc bloc,
    LedgerState state,
  ) async {
    final statement = state.statement;
    if (statement == null) return;

    final recorded = await RecordPaymentSheet.show(
      context,
      customer: statement.customer,
      balance: statement.balance,
      ledgerBloc: bloc,
    );

    if (recorded && context.mounted) {
      AppSnackbar.showSuccess(
        context,
        AppLocalizations.of(context)!.ledgerPaymentSuccess,
      );
      bloc.add(LedgerLoadStatementEvent(customerId: widget.customerId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

    return BlocProvider(
      create: (_) => getIt<LedgerBloc>()
        ..add(LedgerLoadStatementEvent(customerId: widget.customerId)),
      child: BlocBuilder<LedgerBloc, LedgerState>(
        builder: (context, state) {
          if (state.status == LedgerStatus.loading && state.statement == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.ledgerStatement,
                showBackButton: true,
              ),
              body: const LoadingWidget(),
            );
          }
          if (state.status == LedgerStatus.error && state.statement == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.ledgerStatement,
                showBackButton: true,
              ),
              body: ErrorStateWidget(
                message: state.message ?? l10n.msgSomethingWentWrong,
                retryLabel: l10n.btnRetry,
                onRetry: () => context.read<LedgerBloc>().add(
                      LedgerLoadStatementEvent(customerId: widget.customerId),
                    ),
              ),
            );
          }

          final statement = state.statement;
          if (statement == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.ledgerStatement,
                showBackButton: true,
              ),
              body: EmptyStateWidget(
                icon: LucideIcons.scrollText,
                title: l10n.ledgerStatementEmptyTitle,
                subtitle: l10n.ledgerStatementEmptySubtitle,
              ),
            );
          }

          final opening = LedgerStatementBalanceCalculator.openingBalance(
            currentBalance: statement.balance,
            entries: statement.entries,
          );
          final rows = LedgerStatementBalanceCalculator.buildRows(
            statement.entries,
            opening,
          );

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppTopBar(
              title: l10n.ledgerStatement,
              showBackButton: true,
              actions: [
                IconButton(
                  icon: const Icon(LucideIcons.ellipsisVertical),
                  onPressed: () => _openRecordPayment(
                    context,
                    context.read<LedgerBloc>(),
                    state,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: CustomerResponsiveBody(
                      includeBottomInset: false,
                      maxWidth: isDesktop ? 880 : 960,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          LedgerStatementProfileCard(
                            customer: statement.customer,
                            balance: statement.balance,
                          ),
                          const SizedBox(height: AppDimensions.space24),
                          Row(
                            children: [
                              Text(
                                l10n.ledgerStatement,
                                style: AppTextStyles.headlineSmall,
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimensions.space12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surface,
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radiusMedium,
                                  ),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedPeriod,
                                    items: LedgerStatementPeriodFilter
                                        .monthOptions()
                                        .map(
                                          (m) => DropdownMenuItem(
                                            value: m,
                                            child: Text(m),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        setState(() => _selectedPeriod = value);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppDimensions.space8),
                          if (opening != 0)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppDimensions.space12,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      l10n.ledgerOpeningBalance,
                                      style: AppTextStyles.labelMedium,
                                    ),
                                  ),
                                  Text(
                                    l10n.ledgerRunningBalance(
                                      Formatters.currency(opening.abs()),
                                    ),
                                    style: AppTextStyles.numberSmall,
                                  ),
                                ],
                              ),
                            ),
                          if (rows.isEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppDimensions.space32,
                              ),
                              child: Text(
                                l10n.ledgerNoEntries,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.neutral,
                                ),
                              ),
                            )
                          else
                            ...rows.map(
                              (row) => Column(
                                children: [
                                  LedgerStatementEntryRow(
                                    entry: row.entry,
                                    runningBalance: row.runningBalance,
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: AppColors.border,
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(height: AppDimensions.space16),
                          Text(
                            l10n.ledgerStatementEnd,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.neutral,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.space24),
                          OutlinedButtonWidget(
                            label: l10n.ledgerShareStatement,
                            icon: LucideIcons.share2,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (statement.balance > 0)
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
                              context.read<LedgerBloc>(),
                              state,
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
