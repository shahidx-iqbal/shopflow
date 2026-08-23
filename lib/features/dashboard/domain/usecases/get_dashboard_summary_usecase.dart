import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/dashboard_summary_entity.dart';
import '../repositories/dashboard_repository.dart';

/// Loads today's sales, orders, low-stock, and pending ledger metrics.
@injectable
class GetDashboardSummaryUseCase
    implements UseCase<DashboardSummaryEntity, NoParams> {
  GetDashboardSummaryUseCase(this._repository);
  final DashboardRepository _repository;
  @override
  Future<Either<Failure, DashboardSummaryEntity>> call(NoParams params) =>
      _repository.getSummary();
}
