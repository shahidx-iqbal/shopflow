import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../domain/entities/ledger_entry_entity.dart';

class LedgerEntryTile extends StatelessWidget {
  const LedgerEntryTile({required this.entry, super.key});
  final LedgerEntryEntity entry;

  @override
  Widget build(BuildContext context) {
    final isDebit = entry.type == LedgerEntryType.debit;
    return ListTile(
      title: Text(entry.notes ?? entry.type.name, style: AppTextStyles.labelMedium),
      subtitle: Text(Formatters.dateTime(entry.createdAt), style: AppTextStyles.bodySmall),
      trailing: Text(
        Formatters.currency(entry.amount),
        style: AppTextStyles.numberSmall.copyWith(
          color: isDebit ? AppColors.danger : AppColors.primary,
        ),
      ),
    );
  }
}
