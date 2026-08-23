import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/customer_entity.dart';
import '../repositories/customer_repository.dart';

/// Creates a new ledger customer.
@injectable
class AddCustomerUseCase implements UseCase<CustomerEntity, CustomerEntity> {
  AddCustomerUseCase(this._repository);
  final CustomerRepository _repository;
  @override
  Future<Either<Failure, CustomerEntity>> call(CustomerEntity params) =>
      _repository.addCustomer(params);
}
