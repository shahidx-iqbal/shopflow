import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/customer_entity.dart';
import 'customer_avatar.dart';
import 'customer_status_badge.dart';

/// Customer list card — avatar, contact info, ledger balance, and status.
class CustomerCard extends StatelessWidget {
  const CustomerCard({
    required this.customer,
    required this.onTap,
    this.onEdit,
    this.onDelete,
    super.key,
  });

  final CustomerEntity customer;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hasOutstanding = customer.balance > 0;

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppDimensions.space16),
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerAvatar(name: customer.name),
                const SizedBox(width: AppDimensions.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer.name,
                        style: AppTextStyles.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppDimensions.space4),
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.phone,
                            size: 14,
                            color: AppColors.neutral,
                          ),
                          const SizedBox(width: AppDimensions.space4),
                          Expanded(
                            child: Text(
                              customer.phone,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.neutral,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (onEdit != null || onDelete != null)
                  PopupMenuButton<String>(
                    icon: const Icon(
                      LucideIcons.ellipsisVertical,
                      size: 20,
                      color: AppColors.neutral,
                    ),
                    onSelected: (value) {
                      if (value == 'edit') onEdit?.call();
                      if (value == 'delete') onDelete?.call();
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text(l10n.btnEdit),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          l10n.btnDelete,
                          style: const TextStyle(color: AppColors.danger),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const Spacer(),
            Text(
              l10n.customerPendingLedger.toUpperCase(),
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.neutral,
                letterSpacing: 0.8,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppDimensions.space4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    Formatters.currency(customer.balance),
                    style: AppTextStyles.numberLarge.copyWith(
                      fontSize: 22,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CustomerStatusBadge(hasOutstanding: hasOutstanding),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
