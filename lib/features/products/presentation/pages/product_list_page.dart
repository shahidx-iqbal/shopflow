import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../widgets/product_catalog_scaffold.dart';

/// Product catalog from More menu — same grid UI as Inventory tab.
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ProductCatalogScaffold(
      title: l10n.productsTitle,
      subtitle: l10n.productsSubtitle,
    );
  }
}
