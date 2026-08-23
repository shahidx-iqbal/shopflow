import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/report_summary_entity.dart';
import '../../domain/repositories/reports_repository.dart';
import '../datasource/reports_datasource.dart';

@LazySingleton(as: ReportsRepository)
class ReportsRepositoryImpl implements ReportsRepository {
  ReportsRepositoryImpl(this._dataSource);

  final ReportsDataSource _dataSource;

  @override
  Future<Either<Failure, ReportSummaryEntity>> getReport({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      return Right(
        (await _dataSource.getReport(
          startDate: startDate,
          endDate: endDate,
        ))
            .toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
