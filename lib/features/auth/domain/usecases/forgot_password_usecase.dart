import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

/// Sends a password-reset OTP. May return a development OTP echoed by the API.
@injectable
class ForgotPasswordUseCase
    implements UseCase<String?, ForgotPasswordParams> {
  ForgotPasswordUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, String?>> call(ForgotPasswordParams params) {
    return _repository.forgotPassword(identifier: params.identifier);
  }
}

class ForgotPasswordParams extends Equatable {
  const ForgotPasswordParams({required this.identifier});

  final String identifier;

  @override
  List<Object?> get props => [identifier];
}
