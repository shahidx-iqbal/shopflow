import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/customer_entity.dart';
import '../repositories/customer_repository.dart';

/// Updates an existing ledger customer.
@injectable
class UpdateCustomerUseCase implements UseCase<CustomerEntity, CustomerEntity> {
  UpdateCustomerUseCase(this._repository);
  final CustomerRepository _repository;
  @override
  Future<Either<Failure, CustomerEntity>> call(CustomerEntity params) =>
      _repository.updateCustomer(params);
}
