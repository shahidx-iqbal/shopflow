import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../l10n/app_localizations.dart';

/// Hero balance card on the customer detail screen.
class CustomerBalanceOverview extends StatelessWidget {
  const CustomerBalanceOverview({
    required this.balance,
    super.key,
  });

  final double balance;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hasOutstanding = balance > 0;

    return AppCard(
      padding: const EdgeInsets.all(AppDimensions.space20),
      color: hasOutstanding ? AppColors.tertiaryLight : AppColors.primaryLight,
      child: Column(
        children: [
          Text(
            l10n.customerTotalLedgerBalance.toUpperCase(),
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.neutral,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: AppDimensions.space8),
          Text(
            Formatters.currency(balance),
            style: AppTextStyles.numberLarge.copyWith(fontSize: 32),
          ),
          if (hasOutstanding) ...[
            const SizedBox(height: AppDimensions.space8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.space12,
                vertical: AppDimensions.space4,
              ),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
              ),
              child: Text(
                l10n.customerPendingSettlement,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.tertiary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
