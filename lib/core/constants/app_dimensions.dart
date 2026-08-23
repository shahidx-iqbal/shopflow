/// Spacing, radii, and sizing constants on an 8pt grid.
class AppDimensions {
  AppDimensions._();

  // —— Spacing (8pt grid) ——

  static const double space4 = 4;
  static const double space8 = 8;
  static const double space10 = 10;
  static const double space12 = 12;
  static const double space14 = 14;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space40 = 40;
  static const double space48 = 48;
  static const double space56 = 56;
  static const double space64 = 64;
  static const double space80 = 80;

  // —— Corner radii ——

  /// Buttons and inputs (14px).
  static const double radiusSmall = 14;

  /// Alternate control radius (16px).
  static const double radiusMedium = 16;

  /// Cards and sheets (18px).
  static const double radiusLarge = 18;

  /// Fully circular (icon buttons, avatars).
  static const double radiusFull = 999;

  // —— Component sizes ——

  /// Standard button height.
  static const double buttonHeight = 52;

  /// Icon action button diameter.
  static const double iconButtonSize = 48;

  /// Default horizontal page padding.
  static const double pagePadding = space16;

  /// Soft card elevation shadow blur.
  static const double cardElevation = 2;
}
