import 'package:equatable/equatable.dart';

/// Base failure type returned by repositories and usecases.
abstract class Failure extends Equatable {
  const Failure({required this.message, this.code});

  final String message;
  final String? code;

  @override
  List<Object?> get props => [message, code];
}

/// Failure originating from a remote API / server error.
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.code});
}

/// Failure originating from local cache / Hive operations.
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code});
}

/// Failure when the device has no network connectivity.
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection',
    super.code,
  });
}

/// Failure for client-side validation errors.
class ValidationFailure extends Failure {
  const ValidationFailure({required super.message, super.code});
}

/// Failure for unexpected / unmapped errors.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    super.message = 'An unexpected error occurred',
    super.code,
  });
}
