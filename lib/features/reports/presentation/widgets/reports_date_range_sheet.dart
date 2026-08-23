import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../l10n/app_localizations.dart';

/// Bottom sheet for picking a custom report date range.
class ReportsDateRangeSheet extends StatefulWidget {
  const ReportsDateRangeSheet({
    required this.initialStart,
    required this.initialEnd,
    super.key,
  });

  final DateTime initialStart;
  final DateTime initialEnd;

  static Future<(DateTime, DateTime)?> show(
    BuildContext context, {
    required DateTime initialStart,
    required DateTime initialEnd,
  }) {
    return showModalBottomSheet<(DateTime, DateTime)>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      builder: (_) => ReportsDateRangeSheet(
        initialStart: initialStart,
        initialEnd: initialEnd,
      ),
    );
  }

  @override
  State<ReportsDateRangeSheet> createState() => _ReportsDateRangeSheetState();
}

class _ReportsDateRangeSheetState extends State<ReportsDateRangeSheet> {
  late DateTime _start;
  late DateTime _end;

  @override
  void initState() {
    super.initState();
    _start = widget.initialStart;
    _end = widget.initialEnd;
  }

  Future<void> _pickStart() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _start,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _start = picked;
        if (_end.isBefore(_start)) _end = _start;
      });
    }
  }

  Future<void> _pickEnd() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _end.isBefore(_start) ? _start : _end,
      firstDate: _start,
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _end = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.pagePadding,
        AppDimensions.space16,
        AppDimensions.pagePadding,
        MediaQuery.paddingOf(context).bottom + AppDimensions.space24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.reportsSelectDateRange,
            style: AppTextStyles.headlineSmall,
          ),
          const SizedBox(height: AppDimensions.space24),
          _DateField(
            label: l10n.reportsStartDate,
            value: Formatters.date(_start),
            onTap: _pickStart,
          ),
          const SizedBox(height: AppDimensions.space12),
          _DateField(
            label: l10n.reportsEndDate,
            value: Formatters.date(_end),
            onTap: _pickEnd,
          ),
          const SizedBox(height: AppDimensions.space24),
          PrimaryButton(
            label: l10n.reportsApply,
            onPressed: () => Navigator.of(context).pop((_start, _end)),
          ),
        ],
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
          ),
        ),
        child: Text(value, style: AppTextStyles.labelLarge),
      ),
    );
  }
}
