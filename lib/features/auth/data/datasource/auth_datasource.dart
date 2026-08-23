import '../models/auth_session_model.dart';
import '../models/user_model.dart';

/// Contract for auth operations.
abstract class AuthDataSource {
  Future<AuthSessionModel> login({
    required String identifier,
    required String password,
  });

  Future<AuthSessionModel> register({
    required String name,
    required String shopName,
    required String phone,
    String? email,
    required String password,
  });

  Future<void> verifyOtp({required String phone, required String otp});

  Future<String?> forgotPassword({required String identifier});

  Future<void> resetPassword({
    required String phone,
    required String password,
  });

  Future<void> logout();

  Future<UserModel?> getCurrentUser();
}
