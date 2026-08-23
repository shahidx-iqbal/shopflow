import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/customer_entity.dart';
import '../../domain/repositories/customer_repository.dart';
import '../datasource/customer_datasource.dart';
import '../models/customer_model.dart';

@LazySingleton(as: CustomerRepository)
class CustomerRepositoryImpl implements CustomerRepository {
  CustomerRepositoryImpl(this._dataSource);

  final CustomerDataSource _dataSource;

  @override
  Future<Either<Failure, List<CustomerEntity>>> getCustomers({
    String? query,
  }) async {
    try {
      final list = await _dataSource.getCustomers(query: query);
      return Right(list.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerEntity>> getCustomerById(String id) async {
    try {
      return Right((await _dataSource.getCustomerById(id)).toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerEntity>> addCustomer(
    CustomerEntity customer,
  ) async {
    try {
      final created = await _dataSource.createCustomer(
        CustomerModel.fromEntity(customer),
      );
      return Right(created.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerEntity>> updateCustomer(
    CustomerEntity customer,
  ) async {
    try {
      final updated = await _dataSource.updateCustomer(
        CustomerModel.fromEntity(customer),
      );
      return Right(updated.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCustomer(String id) async {
    try {
      await _dataSource.deleteCustomer(id);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
