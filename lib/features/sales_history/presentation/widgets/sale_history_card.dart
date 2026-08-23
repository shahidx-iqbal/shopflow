import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../../../pos/domain/entities/sale_enums.dart';
import '../utils/sale_display_helper.dart';

/// Responsive sale card for the Sales tab — cash and ledger variants.
class SaleHistoryCard extends StatelessWidget {
  const SaleHistoryCard({
    required this.sale,
    required this.onTap,
    this.isDesktop = false,
    super.key,
  });

  final SaleEntity sale;
  final VoidCallback onTap;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final accent = SaleDisplayHelper.accentColor(sale);
    final accentLight = SaleDisplayHelper.accentLightColor(sale);
    final isCash = sale.saleType == SaleType.cash;
    final title = SaleDisplayHelper.title(l10n, sale);
    final statusLabel = SaleDisplayHelper.statusLabel(l10n, sale);
    final statusColor = SaleDisplayHelper.statusColor(sale);
    final statusBackground = SaleDisplayHelper.statusBackgroundColor(sale);
    final itemCount = SaleDisplayHelper.itemCount(sale);
    final initial = title.isNotEmpty ? title[0].toUpperCase() : '?';

    return AppCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(
        bottom: isDesktop ? AppDimensions.space12 : AppDimensions.space8,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 4, color: accent),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(
                    isDesktop
                        ? AppDimensions.space20
                        : AppDimensions.space16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: isDesktop ? 24 : 22,
                        backgroundColor: accentLight,
                        child: Icon(
                          isCash ? LucideIcons.banknote : LucideIcons.bookOpen,
                          color: accent,
                          size: isDesktop ? 22 : 20,
                        ),
                      ),
                      const SizedBox(width: AppDimensions.space12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    title,
                                    style: AppTextStyles.labelMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (isDesktop) ...[
                                  const SizedBox(width: AppDimensions.space12),
                                  Text(
                                    Formatters.currency(sale.total),
                                    style: AppTextStyles.numberSmall.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: AppDimensions.space4),
                            Text(
                              l10n.salesHistoryInvoiceNumber(
                                sale.displayInvoiceNumber,
                              ),
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.neutral,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: AppDimensions.space4),
                            Text(
                              '${Formatters.dateTime(sale.createdAt)} • ${l10n.dashboardItemsCount(itemCount)}',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.neutral,
                              ),
                              maxLines: isDesktop ? 1 : 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (!isDesktop) ...[
                              const SizedBox(height: AppDimensions.space12),
                              Row(
                                children: [
                                  Text(
                                    Formatters.currency(sale.total),
                                    style: AppTextStyles.numberMedium.copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  _StatusBadge(
                                    label: statusLabel,
                                    color: statusColor,
                                    backgroundColor: statusBackground,
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (isDesktop) ...[
                        const SizedBox(width: AppDimensions.space16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _StatusBadge(
                              label: statusLabel,
                              color: statusColor,
                              backgroundColor: statusBackground,
                            ),
                            const SizedBox(height: AppDimensions.space8),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.background,
                              child: Text(
                                initial,
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: AppColors.neutral,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
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

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.color,
    required this.backgroundColor,
  });

  final String label;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.space12,
        vertical: AppDimensions.space4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelSmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
