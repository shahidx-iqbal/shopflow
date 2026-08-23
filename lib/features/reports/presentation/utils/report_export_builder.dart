import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/report_summary_entity.dart';

/// Builds a plain-text report summary for sharing/export.
class ReportExportBuilder {
  ReportExportBuilder._();

  static String build(AppLocalizations l10n, ReportSummaryEntity report) {
    final buffer = StringBuffer()
      ..writeln(l10n.reportsAnalyticsTitle)
      ..writeln(_dateRangeLabel(report))
      ..writeln()
      ..writeln('${l10n.reportsTotalRevenue}: ${Formatters.currency(report.totalSales)}')
      ..writeln('${l10n.reportsNetProfit}: ${Formatters.currency(report.netProfit)}')
      ..writeln(
        '${l10n.reportsLedgerOutstanding}: ${Formatters.currency(report.ledgerOutstanding)}',
      )
      ..writeln('${l10n.reportsCashSales}: ${Formatters.currency(report.cashSales)}')
      ..writeln('${l10n.reportsLedgerSales}: ${Formatters.currency(report.ledgerSales)}')
      ..writeln();

    if (report.topProducts.isNotEmpty) {
      buffer.writeln(l10n.reportsTopProductsVolume);
      for (var i = 0; i < report.topProducts.length; i++) {
        final p = report.topProducts[i];
        buffer.writeln(
          '${i + 1}. ${p.name} — ${p.quantity} ${l10n.reportsUnitsLabel} — ${Formatters.currency(p.revenue)}',
        );
      }
      buffer.writeln();
    }

    if (report.bestCustomers.isNotEmpty) {
      buffer.writeln(l10n.reportsBestCustomersValue);
      for (var i = 0; i < report.bestCustomers.length; i++) {
        final c = report.bestCustomers[i];
        buffer.writeln(
          '${i + 1}. ${c.name} — ${Formatters.currency(c.totalSpent)} (${l10n.reportsVisitsCount(c.visitCount)})',
        );
      }
    }

    return buffer.toString().trim();
  }

  static String _dateRangeLabel(ReportSummaryEntity report) {
    final start = Formatters.date(report.startDate);
    final end = Formatters.date(report.endDate);
    if (start == end) return start;
    return '$start – $end';
  }
}
