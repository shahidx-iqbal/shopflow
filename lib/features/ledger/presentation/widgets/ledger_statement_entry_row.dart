import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/ledger_entry_entity.dart';

/// One ledger statement row with running balance (Dr).
class LedgerStatementEntryRow extends StatelessWidget {
  const LedgerStatementEntryRow({
    required this.entry,
    required this.runningBalance,
    super.key,
  });

  final LedgerEntryEntity entry;
  final double runningBalance;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDebit = entry.type == LedgerEntryType.debit;
    final badgeLabel =
        isDebit ? l10n.ledgerEntrySale : l10n.ledgerEntryPayment;
    final badgeColor = isDebit ? AppColors.danger : AppColors.primary;
    final badgeBg = isDebit ? AppColors.dangerLight : AppColors.primaryLight;
    final amountPrefix = isDebit ? '+ ' : '- ';
    final amountColor = isDebit ? AppColors.textPrimary : AppColors.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.space12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.space8,
                        vertical: AppDimensions.space4,
                      ),
                      decoration: BoxDecoration(
                        color: badgeBg,
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusFull),
                      ),
                      child: Text(
                        badgeLabel,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: badgeColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppDimensions.space8),
                    Text(
                      Formatters.date(entry.createdAt),
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.neutral,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.space8),
                Text(
                  entry.notes ?? badgeLabel,
                  style: AppTextStyles.labelMedium,
                ),
                if (entry.saleId != null) ...[
                  const SizedBox(height: AppDimensions.space4),
                  Text(
                    l10n.ledgerBillReference(entry.saleId!),
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.neutral,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$amountPrefix${Formatters.currency(entry.amount)}',
                style: AppTextStyles.numberSmall.copyWith(color: amountColor),
              ),
              const SizedBox(height: AppDimensions.space4),
              Text(
                l10n.ledgerRunningBalance(
                  Formatters.currency(runningBalance.abs()),
                ),
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.neutral,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Computes chronological running balances for statement rows.
class LedgerStatementBalanceCalculator {
  LedgerStatementBalanceCalculator._();

  static double openingBalance({
    required double currentBalance,
    required List<LedgerEntryEntity> entries,
  }) {
    final totalDebit = entries
        .where((e) => e.type == LedgerEntryType.debit)
        .fold<double>(0, (sum, e) => sum + e.amount);
    final totalCredit = entries
        .where((e) => e.type == LedgerEntryType.credit)
        .fold<double>(0, (sum, e) => sum + e.amount);
    return currentBalance - totalDebit + totalCredit;
  }

  static List<({LedgerEntryEntity entry, double runningBalance})> buildRows(
    List<LedgerEntryEntity> entries,
    double openingBalance,
  ) {
    final sorted = [...entries]
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    var balance = openingBalance;
    return sorted.map((entry) {
      if (entry.type == LedgerEntryType.debit) {
        balance += entry.amount;
      } else {
        balance -= entry.amount;
      }
      return (entry: entry, runningBalance: balance);
    }).toList();
  }
}

/// Month filter labels for the statement period dropdown.
class LedgerStatementPeriodFilter {
  LedgerStatementPeriodFilter._();

  static List<String> monthOptions() {
    final now = DateTime.now();
    return List.generate(6, (index) {
      final date = DateTime(now.year, now.month - index);
      return DateFormat('MMM yyyy').format(date);
    });
  }
}
