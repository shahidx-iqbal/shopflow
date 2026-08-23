import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

/// Sets a new password after OTP verification.
@injectable
class ResetPasswordUseCase implements UseCase<Unit, ResetPasswordParams> {
  ResetPasswordUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(ResetPasswordParams params) {
    return _repository.resetPassword(
      phone: params.phone,
      password: params.password,
    );
  }
}

class ResetPasswordParams extends Equatable {
  const ResetPasswordParams({
    required this.phone,
    required this.password,
  });

  final String phone;
  final String password;

  @override
  List<Object?> get props => [phone, password];
}
