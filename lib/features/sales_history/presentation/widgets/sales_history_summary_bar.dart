import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../../../pos/domain/entities/sale_enums.dart';

/// Summary metrics for the filtered sales list.
class SalesHistorySummaryBar extends StatelessWidget {
  const SalesHistorySummaryBar({
    required this.sales,
    required this.filter,
    super.key,
  });

  final List<SaleEntity> sales;
  final SaleType? filter;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final totalAmount = sales.fold(0.0, (sum, sale) => sum + sale.total);
    final cashSales =
        sales.where((sale) => sale.saleType == SaleType.cash).toList();
    final ledgerSales =
        sales.where((sale) => sale.saleType == SaleType.ledger).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SummaryCard(
          icon: LucideIcons.receipt,
          iconColor: AppColors.secondary,
          iconBackground: AppColors.secondaryLight,
          label: l10n.salesHistorySalesCount(sales.length),
          value: Formatters.currency(totalAmount),
          caption: l10n.salesHistoryTotalLabel,
        ),
        if (filter == null && sales.isNotEmpty) ...[
          const SizedBox(height: AppDimensions.space12),
          LayoutBuilder(
            builder: (context, constraints) {
              final stackVertically = constraints.maxWidth < 520;
              final cashCard = Expanded(
                child: _SummaryCard(
                  icon: LucideIcons.banknote,
                  iconColor: AppColors.primary,
                  iconBackground: AppColors.primaryLight,
                  label: l10n.salesHistoryCashCount(cashSales.length),
                  value: Formatters.currency(
                    cashSales.fold(0.0, (sum, sale) => sum + sale.total),
                  ),
                  caption: l10n.salesFilterCash,
                  compact: true,
                ),
              );
              final ledgerCard = Expanded(
                child: _SummaryCard(
                  icon: LucideIcons.bookOpen,
                  iconColor: AppColors.tertiary,
                  iconBackground: AppColors.tertiaryLight,
                  label: l10n.salesHistoryLedgerCount(ledgerSales.length),
                  value: Formatters.currency(
                    ledgerSales.fold(0.0, (sum, sale) => sum + sale.total),
                  ),
                  caption: l10n.salesFilterLedger,
                  compact: true,
                ),
              );

              if (stackVertically) {
                return Column(
                  children: [
                    _SummaryCard(
                      icon: LucideIcons.banknote,
                      iconColor: AppColors.primary,
                      iconBackground: AppColors.primaryLight,
                      label: l10n.salesHistoryCashCount(cashSales.length),
                      value: Formatters.currency(
                        cashSales.fold(0.0, (sum, sale) => sum + sale.total),
                      ),
                      caption: l10n.salesFilterCash,
                      compact: true,
                    ),
                    const SizedBox(height: AppDimensions.space12),
                    _SummaryCard(
                      icon: LucideIcons.bookOpen,
                      iconColor: AppColors.tertiary,
                      iconBackground: AppColors.tertiaryLight,
                      label: l10n.salesHistoryLedgerCount(ledgerSales.length),
                      value: Formatters.currency(
                        ledgerSales.fold(0.0, (sum, sale) => sum + sale.total),
                      ),
                      caption: l10n.salesFilterLedger,
                      compact: true,
                    ),
                  ],
                );
              }

              return Row(
                children: [
                  cashCard,
                  const SizedBox(width: AppDimensions.space12),
                  ledgerCard,
                ],
              );
            },
          ),
        ],
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.label,
    required this.value,
    required this.caption,
    this.compact = false,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String label;
  final String value;
  final String caption;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        compact ? AppDimensions.space16 : AppDimensions.space20,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimensions.space12),
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: Icon(icon, color: iconColor, size: compact ? 20 : 22),
          ),
          const SizedBox(width: AppDimensions.space16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.neutral,
                  ),
                ),
                const SizedBox(height: AppDimensions.space4),
                Text(
                  value,
                  style: compact
                      ? AppTextStyles.numberMedium
                      : AppTextStyles.numberLarge,
                ),
                const SizedBox(height: AppDimensions.space4),
                Text(
                  label,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.neutral,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
