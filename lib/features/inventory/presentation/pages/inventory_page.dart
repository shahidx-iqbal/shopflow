import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../products/presentation/widgets/product_catalog_scaffold.dart';

/// Inventory tab — product grid with search, filters, and stock badges.
class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ProductCatalogScaffold(
      title: l10n.inventoryTitle,
      subtitle: l10n.inventorySubtitle,
      includeBottomInset: true,
      showStockFilters: true,
    );
  }
}
