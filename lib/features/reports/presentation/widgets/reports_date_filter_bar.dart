import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_breakpoints.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/buttons/outlined_button_widget.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../cubit/reports_cubit.dart';

/// Date filter row with Today shortcut, custom range, and export action.
class ReportsDateFilterBar extends StatelessWidget {
  const ReportsDateFilterBar({
    required this.state,
    required this.onToday,
    required this.onPickRange,
    required this.onExport,
    super.key,
  });

  final ReportsState state;
  final VoidCallback onToday;
  final VoidCallback onPickRange;
  final VoidCallback onExport;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isWide =
        MediaQuery.sizeOf(context).width >= AppBreakpoints.desktop;

    if (isWide) {
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: OutlinedButtonWidget(
              label: _dateLabel(l10n),
              icon: LucideIcons.calendar,
              isExpanded: true,
              onPressed: onPickRange,
            ),
          ),
          const SizedBox(width: AppDimensions.space12),
          if (!state.isTodaySelected) ...[
            Expanded(
              child: OutlinedButtonWidget(
                label: l10n.reportsPeriodToday,
                isExpanded: true,
                onPressed: onToday,
              ),
            ),
            const SizedBox(width: AppDimensions.space12),
          ],
          Expanded(
            child: PrimaryButton(
              label: l10n.reportsExport,
              icon: LucideIcons.download,
              isExpanded: true,
              onPressed: state.report == null ? null : onExport,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButtonWidget(
          label: _dateLabel(l10n),
          icon: LucideIcons.calendar,
          isExpanded: true,
          onPressed: onPickRange,
        ),
        const SizedBox(height: AppDimensions.space8),
        Row(
          children: [
            if (!state.isTodaySelected) ...[
              Expanded(
                child: OutlinedButtonWidget(
                  label: l10n.reportsPeriodToday,
                  isExpanded: true,
                  onPressed: onToday,
                ),
              ),
              const SizedBox(width: AppDimensions.space8),
            ],
            Expanded(
              child: PrimaryButton(
                label: l10n.reportsExport,
                icon: LucideIcons.download,
                isExpanded: true,
                onPressed: state.report == null ? null : onExport,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _dateLabel(AppLocalizations l10n) {
    if (state.isTodaySelected) return l10n.reportsPeriodToday;

    final start = state.startDate;
    final end = state.endDate;
    if (start == null || end == null) return l10n.reportsPeriodToday;

    final startLabel = Formatters.date(start);
    final endLabel = Formatters.date(end);
    if (startLabel == endLabel) return startLabel;
    return '$startLabel – $endLabel';
  }
}
