/// Product unit types — matches Add Product unit dropdown.
enum UnitType {
  pieces,
  bag,
  pack,
  bottle,
  kg,
  liter,
  gram,
  ml;

  bool get allowsDecimalQuantity => switch (this) {
        UnitType.kg ||
        UnitType.liter ||
        UnitType.gram ||
        UnitType.ml =>
          true,
        UnitType.pieces ||
        UnitType.bag ||
        UnitType.pack ||
        UnitType.bottle =>
          false,
      };

  String get label => switch (this) {
        UnitType.pieces => 'Pcs (Pieces)',
        UnitType.bag => 'Bag',
        UnitType.pack => 'Pack',
        UnitType.bottle => 'Bottle',
        UnitType.kg => 'Kg',
        UnitType.liter => 'Liter',
        UnitType.gram => 'Gram',
        UnitType.ml => 'ml',
      };

  /// Parses persisted product unit strings (API / legacy values).
  static UnitType fromString(String raw) {
    final value = raw.trim().toLowerCase();
    return switch (value) {
      'kg' || 'kilogram' || 'kilograms' => UnitType.kg,
      'liter' || 'litre' || 'l' => UnitType.liter,
      'gram' || 'grams' || 'g' => UnitType.gram,
      'ml' || 'milliliter' || 'millilitre' => UnitType.ml,
      'bag' || 'bags' => UnitType.bag,
      'pack' || 'packs' => UnitType.pack,
      'bottle' || 'bottles' => UnitType.bottle,
      'pcs' ||
      'pc' ||
      'piece' ||
      'pieces' ||
      'unit' ||
      'units' =>
        UnitType.pieces,
      _ => UnitType.pieces,
    };
  }
}
