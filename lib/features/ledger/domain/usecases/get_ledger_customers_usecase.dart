import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../repositories/ledger_repository.dart';

/// Fetches customers with outstanding ledger balances.
@injectable
class GetLedgerCustomersUseCase
    implements UseCase<List<CustomerEntity>, NoParams> {
  GetLedgerCustomersUseCase(this._repository);
  final LedgerRepository _repository;
  @override
  Future<Either<Failure, List<CustomerEntity>>> call(NoParams params) =>
      _repository.getLedgerCustomers();
}
