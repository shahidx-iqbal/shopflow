/// Base exception thrown by the data layer; mapped to [Failure] in repositories.
class AppException implements Exception {
  const AppException({required this.message, this.code});

  final String message;
  final String? code;

  @override
  String toString() => 'AppException(message: $message, code: $code)';
}

/// Thrown when a remote API call fails.
class ServerException extends AppException {
  const ServerException({required super.message, super.code});
}

/// Thrown when a local cache / Hive operation fails.
class CacheException extends AppException {
  const CacheException({required super.message, super.code});
}

/// Thrown when the device has no network connectivity.
class NetworkException extends AppException {
  const NetworkException({
    super.message = 'No internet connection',
    super.code,
  });
}

/// Thrown for client-side validation errors in the data layer.
class ValidationException extends AppException {
  const ValidationException({required super.message, super.code});
}
