import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/customer_entity.dart';

/// Contract for ledger customer operations.
abstract class CustomerRepository {
  Future<Either<Failure, List<CustomerEntity>>> getCustomers({String? query});
  Future<Either<Failure, CustomerEntity>> getCustomerById(String id);
  Future<Either<Failure, CustomerEntity>> addCustomer(CustomerEntity customer);
  Future<Either<Failure, CustomerEntity>> updateCustomer(CustomerEntity customer);
  Future<Either<Failure, Unit>> deleteCustomer(String id);
}
