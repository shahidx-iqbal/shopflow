import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/report_summary_entity.dart';
import '../repositories/reports_repository.dart';

/// Loads a shop report for the given date range.
@injectable
class GetReportUseCase implements UseCase<ReportSummaryEntity, GetReportParams> {
  GetReportUseCase(this._repository);
  final ReportsRepository _repository;

  @override
  Future<Either<Failure, ReportSummaryEntity>> call(GetReportParams params) =>
      _repository.getReport(
        startDate: params.startDate,
        endDate: params.endDate,
      );
}

class GetReportParams extends Equatable {
  const GetReportParams({
    required this.startDate,
    required this.endDate,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  List<Object?> get props => [startDate, endDate];
}
