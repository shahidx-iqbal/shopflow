import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../local_storage/shared_prefs_service.dart';

/// Attaches the stored auth bearer token to outgoing requests.
@lazySingleton
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._prefs);

  final SharedPrefsService _prefs;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _prefs.authToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
