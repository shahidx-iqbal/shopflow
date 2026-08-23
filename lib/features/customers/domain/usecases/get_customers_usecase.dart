import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/customer_entity.dart';
import '../repositories/customer_repository.dart';

/// Fetches ledger customers, optionally filtered by query.
@injectable
class GetCustomersUseCase implements UseCase<List<CustomerEntity>, GetCustomersParams> {
  GetCustomersUseCase(this._repository);
  final CustomerRepository _repository;
  @override
  Future<Either<Failure, List<CustomerEntity>>> call(GetCustomersParams params) =>
      _repository.getCustomers(query: params.query);
}
class GetCustomersParams extends Equatable {
  const GetCustomersParams({this.query});
  final String? query;
  @override
  List<Object?> get props => [query];
}
