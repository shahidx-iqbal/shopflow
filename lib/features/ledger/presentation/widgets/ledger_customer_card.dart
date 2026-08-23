import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../../../customers/presentation/widgets/customer_avatar.dart';

/// Ledger customer card — tap opens statement details.
class LedgerCustomerCard extends StatelessWidget {
  const LedgerCustomerCard({
    required this.customer,
    required this.onTap,
    super.key,
  });

  final CustomerEntity customer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppDimensions.space16),
      child: Row(
        children: [
          CustomerAvatar(name: customer.name, radius: 24),
          const SizedBox(width: AppDimensions.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(customer.name, style: AppTextStyles.labelLarge),
                const SizedBox(height: AppDimensions.space4),
                Row(
                  children: [
                    const Icon(
                      LucideIcons.phone,
                      size: 14,
                      color: AppColors.neutral,
                    ),
                    const SizedBox(width: AppDimensions.space4),
                    Text(customer.phone, style: AppTextStyles.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Formatters.currency(customer.balance),
                style: AppTextStyles.numberSmall.copyWith(
                  color: AppColors.tertiary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppDimensions.space4),
              Text(
                l10n.ledgerOutstanding,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.tertiary,
                ),
              ),
            ],
          ),
          const SizedBox(width: AppDimensions.space8),
          Icon(
            LucideIcons.chevronRight,
            size: 18,
            color: AppColors.neutral.withValues(alpha: 0.6),
          ),
        ],
      ),
    );
  }
}
