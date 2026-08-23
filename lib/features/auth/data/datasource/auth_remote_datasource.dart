import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/local_storage/shared_prefs_service.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../models/auth_session_model.dart';
import '../models/user_model.dart';
import 'auth_datasource.dart';

/// Remote REST auth — caches session locally after successful calls.
@LazySingleton(as: AuthDataSource)
class AuthRemoteDataSource implements AuthDataSource {
  AuthRemoteDataSource(this._client, this._prefs);

  final ApiClient _client;
  final SharedPrefsService _prefs;
  static const _userKey = 'cached_user';

  Future<void> _cacheSession(AuthSessionModel session) async {
    await _prefs.setAuthToken(session.token);
    await _prefs.setUserId(session.user.id);
    await _prefs.setString(_userKey, jsonEncode(session.user.toJson()));
  }

  @override
  Future<AuthSessionModel> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.login,
        data: {'identifier': identifier, 'password': password},
      );
      final body = response.data as Map<String, dynamic>;
      final session = parseApiObjectData(body, AuthSessionModel.fromJson);
      await _cacheSession(session);
      return session;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AuthSessionModel> register({
    required String name,
    required String shopName,
    required String phone,
    String? email,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.register,
        data: {
          'name': name,
          'shop_name': shopName,
          'phone': phone,
          'email': email,
          'password': password,
        },
      );
      final body = response.data as Map<String, dynamic>;
      final session = parseApiObjectData(body, AuthSessionModel.fromJson);
      await _cacheSession(session);
      return session;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> verifyOtp({required String phone, required String otp}) async {
    try {
      await _client.post(
        ApiEndpoints.verifyOtp,
        data: {'phone': phone, 'otp': otp},
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String?> forgotPassword({required String identifier}) async {
    try {
      final response = await _client.post(
        ApiEndpoints.forgotPassword,
        data: {'identifier': identifier},
      );
      final body = response.data;
      if (body is! Map<String, dynamic>) return null;
      final data = body['data'];
      if (data is Map<String, dynamic>) {
        final otp = data['otp'];
        if (otp != null && otp.toString().trim().isNotEmpty) {
          return otp.toString().trim();
        }
      }
      return null;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> resetPassword({
    required String phone,
    required String password,
  }) async {
    try {
      await _client.post(
        ApiEndpoints.resetPassword,
        data: {'phone': phone, 'password': password},
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _client.post(ApiEndpoints.logout);
    } catch (_) {
      // Clear local session even if remote logout fails.
    }
    await _prefs.clearAuthToken();
    await _prefs.remove(_userKey);
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final raw = _prefs.getString(_userKey);
    if (raw == null) return null;
    return UserModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }
}
