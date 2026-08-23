import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_session_entity.dart';
import '../entities/user_entity.dart';

/// Contract for authentication operations.
abstract class AuthRepository {
  Future<Either<Failure, AuthSessionEntity>> login({
    required String identifier,
    required String password,
  });

  Future<Either<Failure, AuthSessionEntity>> register({
    required String name,
    required String shopName,
    required String phone,
    String? email,
    required String password,
  });

  Future<Either<Failure, Unit>> verifyOtp({
    required String phone,
    required String otp,
  });

  Future<Either<Failure, String?>> forgotPassword({required String identifier});

  Future<Either<Failure, Unit>> resetPassword({
    required String phone,
    required String password,
  });

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, UserEntity?>> getCurrentUser();
}
