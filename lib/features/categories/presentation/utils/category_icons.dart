import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Maps category icon keys from the API to Lucide icons.
class CategoryIcons {
  CategoryIcons._();

  static const String defaultKey = 'package';

  /// Icons available in the category form picker (order matches UI grid).
  static const List<String> pickerKeys = [
    'milk',
    'croissant',
    'droplets',
    'iceCream',
    'package',
    'bottle',
    'wine',
    'brush',
    'pawPrint',
    'ellipsis',
    'apple',
    'coffee',
    'cookie',
    'beef',
    'wheat',
    'fish',
  ];

  static IconData resolve(String key) {
    return switch (key) {
      'apple' => LucideIcons.apple,
      'milk' => LucideIcons.milk,
      'coffee' => LucideIcons.coffee,
      'cookie' => LucideIcons.cookie,
      'beef' => LucideIcons.beef,
      'croissant' => LucideIcons.croissant,
      'droplets' => LucideIcons.droplets,
      'iceCream' => LucideIcons.iceCreamCone,
      'bottle' => LucideIcons.bottleWine,
      'wine' => LucideIcons.wine,
      'brush' => LucideIcons.brush,
      'pawPrint' => LucideIcons.pawPrint,
      'ellipsis' => LucideIcons.ellipsis,
      'wheat' => LucideIcons.wheat,
      'fish' => LucideIcons.fish,
      'package' => LucideIcons.package,
      _ => LucideIcons.package,
    };
  }
}
