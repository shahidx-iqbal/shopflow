import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Typed SharedPreferences wrapper for auth token, locale, and onboarding flag.
@lazySingleton
class SharedPrefsService {
  SharedPrefsService(this._prefs);

  final SharedPreferences _prefs;

  static const String _keyAuthToken = 'auth_token';
  static const String _keySelectedLocale = 'selected_locale';
  static const String _keyHasCompletedOnboarding = 'has_completed_onboarding';
  static const String _keyUserId = 'user_id';

  // —— Auth token ——

  String? get authToken => _prefs.getString(_keyAuthToken);

  Future<bool> setAuthToken(String token) =>
      _prefs.setString(_keyAuthToken, token);

  Future<bool> clearAuthToken() => _prefs.remove(_keyAuthToken);

  bool get isAuthenticated => authToken != null && authToken!.isNotEmpty;

  // —— Locale ——

  String get selectedLocale => _prefs.getString(_keySelectedLocale) ?? 'en';

  Future<bool> setSelectedLocale(String locale) =>
      _prefs.setString(_keySelectedLocale, locale);

  // —— Onboarding ——

  bool get hasCompletedOnboarding =>
      _prefs.getBool(_keyHasCompletedOnboarding) ?? false;

  Future<bool> setHasCompletedOnboarding({required bool value}) =>
      _prefs.setBool(_keyHasCompletedOnboarding, value);

  // —— User id ——

  String? get userId => _prefs.getString(_keyUserId);

  Future<bool> setUserId(String id) => _prefs.setString(_keyUserId, id);

  // —— Generic helpers ——

  Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);

  String? getString(String key) => _prefs.getString(key);

  Future<bool> setBool(String key, {required bool value}) =>
      _prefs.setBool(key, value);

  bool? getBool(String key) => _prefs.getBool(key);

  Future<bool> remove(String key) => _prefs.remove(key);

  Future<bool> clear() => _prefs.clear();
}
