import 'package:equatable/equatable.dart';

/// Standard REST API envelope matching the future backend contract.
///
/// ```json
/// { "success": true, "message": "...", "data": ... }
/// ```
class ApiResponse<T> extends Equatable {
  const ApiResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final T data;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => {
        'success': success,
        'message': message,
        'data': toJsonT(data),
      };

  @override
  List<Object?> get props => [success, message, data];
}

/// Parses a list payload from an API envelope JSON map.
List<T> parseApiListData<T>(
  Map<String, dynamic> json,
  T Function(Map<String, dynamic> json) fromJson,
) {
  final data = json['data'];
  if (data is! List) return [];
  return data
      .map((e) => fromJson(e as Map<String, dynamic>))
      .toList();
}

/// Parses a single-object payload from an API envelope JSON map.
T parseApiObjectData<T>(
  Map<String, dynamic> json,
  T Function(Map<String, dynamic> json) fromJson,
) {
  final data = json['data'];
  return fromJson(data as Map<String, dynamic>);
}
