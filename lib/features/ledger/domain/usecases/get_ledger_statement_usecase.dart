import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/ledger_statement_entity.dart';
import '../repositories/ledger_repository.dart';

/// Loads the full ledger statement for a customer.
@injectable
class GetLedgerStatementUseCase
    implements UseCase<LedgerStatementEntity, GetLedgerStatementParams> {
  GetLedgerStatementUseCase(this._repository);
  final LedgerRepository _repository;
  @override
  Future<Either<Failure, LedgerStatementEntity>> call(
    GetLedgerStatementParams params,
  ) =>
      _repository.getStatement(params.customerId);
}
class GetLedgerStatementParams extends Equatable {
  const GetLedgerStatementParams({required this.customerId});
  final String customerId;
  @override
  List<Object?> get props => [customerId];
}
