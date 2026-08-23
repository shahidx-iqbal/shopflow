import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/report_summary_entity.dart';

/// Summary metric cards for revenue, profit, and ledger outstanding.
class ReportsSummarySection extends StatelessWidget {
  const ReportsSummarySection({
    required this.report,
    required this.isDesktop,
    this.onViewLedger,
    super.key,
  });

  final ReportSummaryEntity report;
  final bool isDesktop;
  final VoidCallback? onViewLedger;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final revenueCard = _MetricCard(
      icon: LucideIcons.banknote,
      iconColor: AppColors.secondary,
      iconBackground: AppColors.secondaryLight,
      label: l10n.reportsTotalRevenue,
      value: Formatters.currency(report.totalSales),
      subtitle: _growthSubtitle(l10n, report.revenueGrowthPercent),
    );

    final profitCard = _MetricCard(
      icon: LucideIcons.trendingUp,
      iconColor: AppColors.primary,
      iconBackground: AppColors.primaryLight,
      label: l10n.reportsNetProfit,
      value: Formatters.currency(report.netProfit),
      subtitle: report.totalSales > 0
          ? l10n.reportsProfitMargin(
              ((report.netProfit / report.totalSales) * 100).toStringAsFixed(1),
            )
          : null,
    );

    final ledgerCard = _LedgerOutstandingCard(
      report: report,
      onViewLedger: onViewLedger,
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: revenueCard),
          const SizedBox(width: AppDimensions.space16),
          Expanded(child: profitCard),
          const SizedBox(width: AppDimensions.space16),
          Expanded(child: ledgerCard),
        ],
      );
    }

    return Column(
      children: [
        revenueCard,
        const SizedBox(height: AppDimensions.space12),
        profitCard,
        const SizedBox(height: AppDimensions.space12),
        ledgerCard,
      ],
    );
  }

  String? _growthSubtitle(AppLocalizations l10n, double? growth) {
    if (growth == null) return null;
    final sign = growth >= 0 ? '+' : '';
    return l10n.reportsGrowthFromPrevious('$sign${growth.toStringAsFixed(1)}');
  }
}

class _LedgerOutstandingCard extends StatelessWidget {
  const _LedgerOutstandingCard({
    required this.report,
    this.onViewLedger,
  });

  final ReportSummaryEntity report;
  final VoidCallback? onViewLedger;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.tertiaryLight,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusSmall),
                ),
                child: const Icon(
                  LucideIcons.bookOpen,
                  color: AppColors.tertiary,
                  size: 22,
                ),
              ),
              const SizedBox(width: AppDimensions.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.reportsLedgerOutstanding,
                      style: AppTextStyles.bodySmall,
                    ),
                    const SizedBox(height: AppDimensions.space4),
                    Text(
                      Formatters.currency(report.ledgerOutstanding),
                      style: AppTextStyles.numberMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (report.ledgerCustomerCount > 0) ...[
                      const SizedBox(height: AppDimensions.space4),
                      Text(
                        l10n.reportsFromCustomers(report.ledgerCustomerCount),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.neutral,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (onViewLedger != null) ...[
            const SizedBox(height: AppDimensions.space12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onViewLedger,
                child: Text(l10n.reportsViewDetails),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.label,
    required this.value,
    this.subtitle,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String label;
  final String value;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: AppDimensions.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.bodySmall),
                const SizedBox(height: AppDimensions.space4),
                Text(
                  value,
                  style: AppTextStyles.numberMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: AppDimensions.space4),
                  Text(
                    subtitle!,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
