import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../customers/domain/entities/customer_entity.dart';

/// Customer summary header on the ledger statement screen.
class LedgerStatementProfileCard extends StatelessWidget {
  const LedgerStatementProfileCard({
    required this.customer,
    required this.balance,
    super.key,
  });

  final CustomerEntity customer;
  final double balance;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hasDue = balance > 0;
    final khataNumber = customer.id.replaceAll(RegExp(r'[^0-9]'), '');

    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(customer.name, style: AppTextStyles.headlineSmall),
                const SizedBox(height: AppDimensions.space4),
                Text(
                  customer.phone,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.neutral,
                  ),
                ),
                const SizedBox(height: AppDimensions.space12),
                Wrap(
                  spacing: AppDimensions.space8,
                  runSpacing: AppDimensions.space8,
                  children: [
                    _TagChip(
                      label: l10n.ledgerKhataTag(khataNumber.isEmpty ? '—' : khataNumber),
                      color: AppColors.secondary,
                      background: AppColors.secondaryLight,
                    ),
                    _TagChip(
                      label: l10n.ledgerRegularCustomer,
                      color: AppColors.primary,
                      background: AppColors.primaryLight,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: AppDimensions.space12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                l10n.ledgerTotalBalance.toUpperCase(),
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.neutral,
                  letterSpacing: 0.6,
                ),
              ),
              const SizedBox(height: AppDimensions.space4),
              Text(
                Formatters.currency(balance),
                style: AppTextStyles.numberLarge.copyWith(
                  color: hasDue ? AppColors.danger : AppColors.primary,
                  fontSize: 22,
                ),
              ),
              if (hasDue) ...[
                const SizedBox(height: AppDimensions.space4),
                Text(
                  l10n.ledgerDue,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.danger,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({
    required this.label,
    required this.color,
    required this.background,
  });

  final String label;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.space10,
        vertical: AppDimensions.space4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelSmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
