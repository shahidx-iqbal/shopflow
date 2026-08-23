import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/report_summary_entity.dart';

/// Contract for sales reports.
abstract class ReportsRepository {
  Future<Either<Failure, ReportSummaryEntity>> getReport({
    required DateTime startDate,
    required DateTime endDate,
  });
}
