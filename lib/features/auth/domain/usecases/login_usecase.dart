import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_session_entity.dart';
import '../repositories/auth_repository.dart';

/// Authenticates a user with email/phone and password.
@injectable
class LoginUseCase implements UseCase<AuthSessionEntity, LoginParams> {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthSessionEntity>> call(LoginParams params) {
    return _repository.login(
      identifier: params.identifier,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  const LoginParams({required this.identifier, required this.password});

  final String identifier;
  final String password;

  @override
  List<Object?> get props => [identifier, password];
}
