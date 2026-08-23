/// App-wide compile-time configuration.
class AppConfig {
  AppConfig._();

  /// Production API host (used when no override is set).
  static const String productionApiBaseUrl = 'https://api.shopflow.app/v1';

  /// Optional in-code override for a local API, e.g. `http://192.168.1.10:8000/v1`.
  /// Leave empty in production. A `--dart-define=API_BASE_URL=...` value wins.
  // static const String localApiBaseUrl = '';
  static const String localApiBaseUrl = 'http://127.0.0.1:8000/v1';
  static const String _fromDefine = String.fromEnvironment('API_BASE_URL');

  /// Resolved API base URL, including `/v1`.
  ///
  /// Local phone/emulator against a machine API:
  /// `fvm flutter run --dart-define=API_BASE_URL=http://192.168.x.x:8000/v1`
  static String get apiBaseUrl {
    if (_fromDefine.isNotEmpty) return _fromDefine;
    if (localApiBaseUrl.isNotEmpty) return localApiBaseUrl;
    return productionApiBaseUrl;
  }
}
