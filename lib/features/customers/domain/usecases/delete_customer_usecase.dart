import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/customer_repository.dart';

/// Deletes a ledger customer by id.
@injectable
class DeleteCustomerUseCase implements UseCase<Unit, DeleteCustomerParams> {
  DeleteCustomerUseCase(this._repository);
  final CustomerRepository _repository;
  @override
  Future<Either<Failure, Unit>> call(DeleteCustomerParams params) =>
      _repository.deleteCustomer(params.id);
}
class DeleteCustomerParams extends Equatable {
  const DeleteCustomerParams({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}
