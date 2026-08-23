import '../models/report_summary_model.dart';

abstract class ReportsDataSource {
  Future<ReportSummaryModel> getReport({
    required DateTime startDate,
    required DateTime endDate,
  });
}
