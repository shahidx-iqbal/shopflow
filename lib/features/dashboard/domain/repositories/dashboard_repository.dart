import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/dashboard_summary_entity.dart';

/// Contract for dashboard summary data.
abstract class DashboardRepository {
  Future<Either<Failure, DashboardSummaryEntity>> getSummary();
}
