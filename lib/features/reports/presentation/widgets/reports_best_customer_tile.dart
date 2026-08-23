import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../customers/presentation/widgets/customer_avatar.dart';
import '../../domain/entities/report_summary_entity.dart';

/// Best customer row ranked by total spend in the selected period.
class ReportsBestCustomerTile extends StatelessWidget {
  const ReportsBestCustomerTile({
    required this.customer,
    super.key,
  });

  final BestCustomerEntity customer;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.space8),
      child: Row(
        children: [
          CustomerAvatar(name: customer.name, radius: 22),
          const SizedBox(width: AppDimensions.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer.name,
                  style: AppTextStyles.labelLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppDimensions.space4),
                Text(
                  l10n.reportsVisitsCount(customer.visitCount),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.neutral,
                  ),
                ),
              ],
            ),
          ),
          Text(
            Formatters.currency(customer.totalSpent),
            style: AppTextStyles.labelMedium.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
