import 'package:flutter/foundation.dart';

/// Thin debug logging wrapper — silent in release builds.
class AppLogger {
  AppLogger._();

  static void d(String message, {String tag = 'ShopFlow'}) {
    if (kDebugMode) {
      debugPrint('[$tag] $message');
    }
  }

  static void e(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String tag = 'ShopFlow',
  }) {
    if (kDebugMode) {
      debugPrint('[$tag] ERROR: $message');
      if (error != null) debugPrint('[$tag] $error');
      if (stackTrace != null) debugPrint('[$tag] $stackTrace');
    }
  }
}
