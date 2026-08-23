import 'package:flutter/material.dart';

/// Design token colors for ShopFlow.
/// Flat, light-mode-only — no dark theme variants.
class AppColors {
  AppColors._();

  /// Primary green — buttons, success, checkout, Cash Sale.
  static const Color primary = Color(0xFF10B981);

  /// Secondary blue — links, info, charts, secondary buttons.
  static const Color secondary = Color(0xFF2563EB);

  /// Tertiary amber — pending ledger, warnings, Ledger Sale.
  static const Color tertiary = Color(0xFFF59E0B);

  /// Danger red — delete, low stock, errors.
  static const Color danger = Color(0xFFEF4444);

  /// Neutral slate — secondary text, disabled states.
  static const Color neutral = Color(0xFF64748B);

  /// Screen background.
  static const Color background = Color(0xFFF8FAFC);

  /// Surface / card / sheet / dialog background.
  static const Color surface = Color(0xFFFFFFFF);

  /// Headings and primary text.
  static const Color textPrimary = Color(0xFF0F172A);

  /// Dividers and input borders.
  static const Color border = Color(0xFFE2E8F0);

  /// Light primary tint for secondary-style fills.
  static Color get primaryLight => primary.withValues(alpha: 0.12);

  /// Light secondary tint for secondary button fills.
  static Color get secondaryLight => secondary.withValues(alpha: 0.12);

  /// Light tertiary tint.
  static Color get tertiaryLight => tertiary.withValues(alpha: 0.12);

  /// Light danger tint.
  static Color get dangerLight => danger.withValues(alpha: 0.12);
}
