import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../../../pos/domain/entities/sale_enums.dart';
import '../../domain/repositories/sales_history_repository.dart';
import '../datasource/sales_history_datasource.dart';

@LazySingleton(as: SalesHistoryRepository)
class SalesHistoryRepositoryImpl implements SalesHistoryRepository {
  SalesHistoryRepositoryImpl(this._dataSource);

  final SalesHistoryDataSource _dataSource;

  @override
  Future<Either<Failure, List<SaleEntity>>> getSales({SaleType? filter}) async {
    try {
      final list = await _dataSource.getSales(filter: filter);
      return Right(list.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SaleEntity>> getSaleById(String id) async {
    try {
      return Right((await _dataSource.getSaleById(id)).toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
