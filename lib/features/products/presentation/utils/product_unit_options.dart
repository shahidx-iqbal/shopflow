import '../../../../l10n/app_localizations.dart';

/// Supported product units for the add-product form dropdown.
class ProductUnitOption {
  const ProductUnitOption({required this.value, required this.labelKey});

  final String value;
  final String Function(AppLocalizations l10n) labelKey;

  static const List<ProductUnitOption> options = [
    ProductUnitOption(value: 'pcs', labelKey: _pcs),
    ProductUnitOption(value: 'bag', labelKey: _bag),
    ProductUnitOption(value: 'pack', labelKey: _pack),
    ProductUnitOption(value: 'bottle', labelKey: _bottle),
    ProductUnitOption(value: 'kg', labelKey: _kg),
    ProductUnitOption(value: 'liter', labelKey: _liter),
  ];

  static String _pcs(AppLocalizations l10n) => l10n.productUnitPcs;
  static String _bag(AppLocalizations l10n) => l10n.productUnitBag;
  static String _pack(AppLocalizations l10n) => l10n.productUnitPack;
  static String _bottle(AppLocalizations l10n) => l10n.productUnitBottle;
  static String _kg(AppLocalizations l10n) => l10n.productUnitKg;
  static String _liter(AppLocalizations l10n) => l10n.productUnitLiter;
}
