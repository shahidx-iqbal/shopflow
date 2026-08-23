import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/dashboard_summary_entity.dart';

/// Adaptive summary metrics — stacked mobile cards, row on desktop.
class DashboardSummarySection extends StatelessWidget {
  const DashboardSummarySection({
    required this.summary,
    required this.isDesktop,
    this.embeddedInPrimaryCard = false,
    super.key,
  });

  final DashboardSummaryEntity summary;
  final bool isDesktop;
  final bool embeddedInPrimaryCard;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (isDesktop) {
      return Row(
        children: [
          Expanded(
            child: _MetricCard(
              title: l10n.dashboardTodaySales,
              value: Formatters.currency(summary.todaySales),
              subtitle: l10n.dashboardSalesGrowth(summary.salesGrowthPercent),
              subtitleColor: AppColors.primary,
              icon: LucideIcons.trendingUp,
              iconColor: AppColors.primary,
              iconBg: AppColors.primaryLight,
            ),
          ),
          const SizedBox(width: AppDimensions.space16),
          Expanded(
            child: _MetricCard(
              title: l10n.dashboardPendingLedger,
              value: Formatters.currency(summary.pendingLedgerAmount),
              subtitle: l10n.dashboardPendingAccounts(
                summary.pendingLedgerAccountsCount,
              ),
              subtitleColor: AppColors.tertiary,
              icon: LucideIcons.bookOpen,
              iconColor: AppColors.tertiary,
              iconBg: AppColors.tertiaryLight,
            ),
          ),
          const SizedBox(width: AppDimensions.space16),
          Expanded(
            child: _MetricCard(
              title: l10n.dashboardLowStock,
              value: l10n.dashboardItemsCount(summary.lowStockCount),
              subtitle: l10n.dashboardRequiresRestock,
              subtitleColor: AppColors.danger,
              icon: LucideIcons.triangleAlert,
              iconColor: AppColors.danger,
              iconBg: AppColors.dangerLight,
            ),
          ),
        ],
      );
    }

    final onPrimary = embeddedInPrimaryCard;
    final labelStyle = AppTextStyles.bodySmall.copyWith(
      color: onPrimary ? Colors.white.withValues(alpha: 0.8) : null,
    );
    final valueLargeStyle = onPrimary
        ? AppTextStyles.numberLarge.copyWith(color: Colors.white)
        : AppTextStyles.numberLarge;
    final valueMediumStyle = onPrimary
        ? AppTextStyles.numberMedium.copyWith(color: Colors.white)
        : AppTextStyles.numberMedium;

    return Column(
      children: [
        _AccentCard(
          accentColor: onPrimary ? Colors.white : AppColors.primary,
          embeddedInPrimaryCard: onPrimary,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.dashboardTodaySales, style: labelStyle),
                    const SizedBox(height: AppDimensions.space8),
                    Text(
                      Formatters.currency(summary.todaySales),
                      style: valueLargeStyle,
                    ),
                    const SizedBox(height: AppDimensions.space4),
                    Text(
                      l10n.dashboardSalesGrowth(summary.salesGrowthPercent),
                      style: AppTextStyles.bodySmall.copyWith(
                        color: onPrimary
                            ? Colors.white.withValues(alpha: 0.9)
                            : AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppDimensions.space12),
                decoration: BoxDecoration(
                  color: onPrimary
                      ? Colors.white.withValues(alpha: 0.2)
                      : AppColors.primaryLight,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radiusMedium),
                ),
                child: Icon(
                  LucideIcons.trendingUp,
                  color: onPrimary ? Colors.white : AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.space12),
        Row(
          children: [
            Expanded(
              child: _AccentCard(
                accentColor: AppColors.tertiary,
                embeddedInPrimaryCard: onPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LucideIcons.wallet,
                          size: 18,
                          color: onPrimary ? Colors.white : AppColors.tertiary,
                        ),
                        const SizedBox(width: AppDimensions.space8),
                        Text(l10n.dashboardLedger, style: labelStyle),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.space8),
                    Text(
                      Formatters.currency(summary.pendingLedgerAmount),
                      style: valueMediumStyle,
                    ),
                    Text(
                      l10n.dashboardOutstanding,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: onPrimary
                            ? const Color(0xFFFCD34D)
                            : AppColors.tertiary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppDimensions.space12),
            Expanded(
              child: _AccentCard(
                accentColor: AppColors.danger,
                embeddedInPrimaryCard: onPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LucideIcons.triangleAlert,
                          size: 18,
                          color: onPrimary ? Colors.white : AppColors.danger,
                        ),
                        const SizedBox(width: AppDimensions.space8),
                        Text(l10n.dashboardAlerts, style: labelStyle),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.space8),
                    Text(
                      l10n.dashboardItemsCount(summary.lowStockCount),
                      style: valueMediumStyle,
                    ),
                    Text(
                      l10n.dashboardLowInStock,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: onPrimary
                            ? const Color(0xFFFCA5A5)
                            : AppColors.danger,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.subtitleColor,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });

  final String title;
  final String value;
  final String subtitle;
  final Color subtitleColor;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;

  @override
  Widget build(BuildContext context) {
    return _AccentCard(
      accentColor: iconColor,
      padding: const EdgeInsets.all(AppDimensions.space20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: AppTextStyles.bodySmall)),
              Container(
                padding: const EdgeInsets.all(AppDimensions.space8),
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.space12),
          Text(value, style: AppTextStyles.numberLarge),
          const SizedBox(height: AppDimensions.space4),
          Text(
            subtitle,
            style: AppTextStyles.bodySmall.copyWith(
              color: subtitleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccentCard extends StatelessWidget {
  const _AccentCard({
    required this.accentColor,
    required this.child,
    this.padding,
    this.embeddedInPrimaryCard = false,
  });

  final Color accentColor;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool embeddedInPrimaryCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: embeddedInPrimaryCard
            ? Colors.white.withValues(alpha: 0.14)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(
          color: embeddedInPrimaryCard
              ? Colors.white.withValues(alpha: 0.22)
              : AppColors.border,
        ),
        boxShadow: embeddedInPrimaryCard
            ? null
            : [
                BoxShadow(
                  color: AppColors.textPrimary.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 4, color: accentColor),
              Expanded(
                child: Padding(
                  padding: padding ?? const EdgeInsets.all(AppDimensions.space16),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: embeddedInPrimaryCard
                          ? Colors.white
                          : AppColors.textPrimary,
                    ),
                    child: IconTheme(
                      data: IconThemeData(
                        color: embeddedInPrimaryCard
                            ? Colors.white.withValues(alpha: 0.9)
                            : null,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
