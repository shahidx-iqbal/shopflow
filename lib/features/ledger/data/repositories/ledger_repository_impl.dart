import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../../domain/entities/ledger_entry_entity.dart';
import '../../domain/entities/ledger_statement_entity.dart';
import '../../domain/repositories/ledger_repository.dart';
import '../datasource/ledger_datasource.dart';

@LazySingleton(as: LedgerRepository)
class LedgerRepositoryImpl implements LedgerRepository {
  LedgerRepositoryImpl(this._dataSource);

  final LedgerDataSource _dataSource;

  @override
  Future<Either<Failure, List<CustomerEntity>>> getLedgerCustomers() async {
    try {
      final list = await _dataSource.getLedgerCustomers();
      return Right(list.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LedgerStatementEntity>> getStatement(
    String customerId,
  ) async {
    try {
      return Right((await _dataSource.getStatement(customerId)).toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LedgerEntryEntity>> recordPayment({
    required String customerId,
    required double amount,
    String? notes,
  }) async {
    try {
      return Right(
        (await _dataSource.recordPayment(
          customerId: customerId,
          amount: amount,
          notes: notes,
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
