import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/customer_entity.dart';
import '../repositories/customer_repository.dart';

/// Fetches a single customer by id.
@injectable
class GetCustomerByIdUseCase implements UseCase<CustomerEntity, GetCustomerByIdParams> {
  GetCustomerByIdUseCase(this._repository);
  final CustomerRepository _repository;
  @override
  Future<Either<Failure, CustomerEntity>> call(GetCustomerByIdParams params) =>
      _repository.getCustomerById(params.id);
}
class GetCustomerByIdParams extends Equatable {
  const GetCustomerByIdParams({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}
