import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/dashboard_recent_transaction_entity.dart';

/// Recent transactions — table on desktop, list on mobile.
class DashboardRecentTransactions extends StatelessWidget {
  const DashboardRecentTransactions({
    required this.transactions,
    required this.isDesktop,
    super.key,
  });

  final List<DashboardRecentTransactionEntity> transactions;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = isDesktop ? transactions.take(4).toList() : transactions.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionHeader(
          title: l10n.dashboardRecentTransactions,
          onViewAll: () => context.push(RouteNames.salesHistory),
        ),
        const SizedBox(height: AppDimensions.space12),
        if (isDesktop)
          _TransactionsTable(transactions: items, l10n: l10n)
        else
          ...items.map(
            (t) => Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.space8),
              child: _TransactionTile(transaction: t, l10n: l10n),
            ),
          ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.onViewAll});

  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(child: Text(title, style: AppTextStyles.headlineSmall)),
        TextButton(onPressed: onViewAll, child: Text(l10n.dashboardViewAll)),
      ],
    );
  }
}

class _TransactionsTable extends StatelessWidget {
  const _TransactionsTable({required this.transactions, required this.l10n});

  final List<DashboardRecentTransactionEntity> transactions;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.space16,
              vertical: AppDimensions.space12,
            ),
            child: Row(
              children: [
                Expanded(flex: 3, child: Text(l10n.dashboardColCustomer, style: _headerStyle)),
                Expanded(flex: 2, child: Text(l10n.dashboardColTime, style: _headerStyle)),
                Expanded(flex: 2, child: Text(l10n.dashboardColItems, style: _headerStyle)),
                Expanded(flex: 2, child: Text(l10n.dashboardColStatus, style: _headerStyle)),
                Expanded(flex: 2, child: Text(l10n.dashboardColAmount, style: _headerStyle, textAlign: TextAlign.end)),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),
          ...transactions.map((t) => _TableRow(transaction: t, l10n: l10n)),
        ],
      ),
    );
  }

  TextStyle get _headerStyle =>
      AppTextStyles.labelSmall.copyWith(color: AppColors.neutral);
}

class _TableRow extends StatelessWidget {
  const _TableRow({required this.transaction, required this.l10n});

  final DashboardRecentTransactionEntity transaction;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.space16,
        vertical: AppDimensions.space14,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(transaction.customerName, style: AppTextStyles.bodyMedium),
          ),
          Expanded(
            flex: 2,
            child: Text(Formatters.time(transaction.createdAt), style: AppTextStyles.bodySmall),
          ),
          Expanded(
            flex: 2,
            child: Text(
              l10n.dashboardItemsCount(transaction.itemCount),
              style: AppTextStyles.bodySmall,
            ),
          ),
          Expanded(
            flex: 2,
            child: _StatusChip(status: transaction.status, l10n: l10n),
          ),
          Expanded(
            flex: 2,
            child: Text(
              Formatters.currency(transaction.amount),
              style: AppTextStyles.numberSmall,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({required this.transaction, required this.l10n});

  final DashboardRecentTransactionEntity transaction;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final isLedger = transaction.status == DashboardTransactionStatus.ledger;
    final initial = transaction.customerName.isNotEmpty
        ? transaction.customerName[0].toUpperCase()
        : '?';

    return Container(
      padding: const EdgeInsets.all(AppDimensions.space12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: isLedger ? AppColors.tertiaryLight : AppColors.secondaryLight,
            child: Text(
              initial,
              style: AppTextStyles.labelMedium.copyWith(
                color: isLedger ? AppColors.tertiary : AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.customerName, style: AppTextStyles.labelMedium),
                const SizedBox(height: AppDimensions.space4),
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodySmall,
                    children: [
                      TextSpan(text: '${Formatters.time(transaction.createdAt)} • '),
                      TextSpan(
                        text: transaction.paymentMethod ?? l10n.dashboardStatusPaid,
                        style: TextStyle(
                          color: isLedger ? AppColors.tertiary : AppColors.neutral,
                          fontWeight: isLedger ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(Formatters.currency(transaction.amount), style: AppTextStyles.numberSmall),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status, required this.l10n});

  final DashboardTransactionStatus status;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final isLedger = status == DashboardTransactionStatus.ledger;
    final color = isLedger ? AppColors.tertiary : AppColors.primary;
    final bg = isLedger ? AppColors.tertiaryLight : AppColors.primaryLight;
    final label = isLedger ? l10n.dashboardStatusLedger : l10n.dashboardStatusPaid;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.space12,
          vertical: AppDimensions.space4,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(color: color),
        ),
      ),
    );
  }
}