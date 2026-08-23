import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../customers/domain/entities/customer_entity.dart';

class LedgerCustomerTile extends StatelessWidget {
  const LedgerCustomerTile({required this.customer, required this.onTap, super.key});
  final CustomerEntity customer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(customer.name, style: AppTextStyles.labelMedium),
      subtitle: Text(customer.phone),
      trailing: Text(
        Formatters.currency(customer.balance),
        style: AppTextStyles.numberSmall.copyWith(color: AppColors.tertiary),
      ),
    );
  }
}
