import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

/// Verifies the OTP sent to the user phone.
@injectable
class VerifyOtpUseCase implements UseCase<Unit, VerifyOtpParams> {
  VerifyOtpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(VerifyOtpParams params) {
    return _repository.verifyOtp(phone: params.phone, otp: params.otp);
  }
}

class VerifyOtpParams extends Equatable {
  const VerifyOtpParams({required this.phone, required this.otp});

  final String phone;
  final String otp;

  @override
  List<Object?> get props => [phone, otp];
}
