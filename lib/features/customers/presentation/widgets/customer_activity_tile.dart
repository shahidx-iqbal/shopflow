import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../ledger/domain/entities/ledger_entry_entity.dart';

/// Ledger activity row for customer detail history / payments tabs.
class CustomerActivityTile extends StatelessWidget {
  const CustomerActivityTile({required this.entry, super.key});

  final LedgerEntryEntity entry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDebit = entry.type == LedgerEntryType.debit;
    final icon = isDebit ? LucideIcons.shoppingBasket : LucideIcons.banknote;
    final iconColor = isDebit ? AppColors.danger : AppColors.primary;
    final iconBg = isDebit ? AppColors.dangerLight : AppColors.primaryLight;
    final amountPrefix = isDebit ? '+' : '-';
    final amountColor = isDebit ? AppColors.textPrimary : AppColors.primary;
    final statusLabel = isDebit ? l10n.customerStatusUnpaid : l10n.customerStatusSettled;
    final statusColor = isDebit ? AppColors.danger : AppColors.primary;
    final statusBg = isDebit ? AppColors.dangerLight : AppColors.primaryLight;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.space8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: AppDimensions.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.notes ?? (isDebit ? l10n.customerLedgerSale : l10n.customerPaymentReceived),
                  style: AppTextStyles.labelMedium,
                ),
                const SizedBox(height: AppDimensions.space4),
                Text(
                  Formatters.dateTime(entry.createdAt),
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
                ),
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.space8,
                  vertical: AppDimensions.space4,
                ),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                ),
                child: Text(
                  statusLabel,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
