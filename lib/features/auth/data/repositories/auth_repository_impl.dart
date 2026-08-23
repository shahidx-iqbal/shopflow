import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/auth_session_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_datasource.dart';

/// [AuthRepository] — depends only on [AuthDataSource].
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dataSource);

  final AuthDataSource _dataSource;

  @override
  Future<Either<Failure, AuthSessionEntity>> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final session = await _dataSource.login(
        identifier: identifier,
        password: password,
      );
      return Right(session.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> register({
    required String name,
    required String shopName,
    required String phone,
    String? email,
    required String password,
  }) async {
    try {
      final session = await _dataSource.register(
        name: name,
        shopName: shopName,
        phone: phone,
        email: email,
        password: password,
      );
      return Right(session.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      await _dataSource.verifyOtp(phone: phone, otp: otp);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> forgotPassword({
    required String identifier,
  }) async {
    try {
      final otp = await _dataSource.forgotPassword(identifier: identifier);
      return Right(otp);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({
    required String phone,
    required String password,
  }) async {
    try {
      await _dataSource.resetPassword(phone: phone, password: password);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _dataSource.logout();
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = await _dataSource.getCurrentUser();
      return Right(user?.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
