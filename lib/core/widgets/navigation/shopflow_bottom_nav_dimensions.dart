/// Layout constants for the floating pill bottom navigation bar.
class ShopflowBottomNavDimensions {
  ShopflowBottomNavDimensions._();

  static const double barHeight = 64;

  /// Half the bar height — correct radius for a pill capsule.
  static const double barCornerRadius = barHeight / 2;

  static const double fabSize = 60;
  static const double fabNotchMargin = 8;
  static const double fabBorderWidth = 4;
  static const double horizontalMargin = 16;
  static const double bottomOffset = 8;

  /// Semicircle notch radius — matches FAB radius + gap.
  static double get fabNotchRadius => fabSize / 2 + fabNotchMargin;

  /// Total stack height: bar + half FAB protruding above.
  static double get stackHeight => barHeight + fabSize / 2;

  /// Vertical space content should reserve above the system inset.
  static const double contentBottomInset = 112;
}
