import 'package:flutter/material.dart';
import 'package:shopflow/l10n/app_localizations.dart';

/// Convenience extensions on [BuildContext].
extension ContextExtensions on BuildContext {
  /// Shortcut to generated [AppLocalizations].
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;

  double get screenHeight => mediaQuery.size.height;

  bool get isTablet => screenWidth >= 600;

  void hideKeyboard() => FocusScope.of(this).unfocus();
}
