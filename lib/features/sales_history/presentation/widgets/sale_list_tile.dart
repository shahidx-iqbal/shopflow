import 'package:flutter/material.dart';

import '../../../pos/domain/entities/sale_entity.dart';
import 'sale_history_card.dart';

/// List tile for a sale in sales history — delegates to [SaleHistoryCard].
class SaleListTile extends StatelessWidget {
  const SaleListTile({
    required this.sale,
    required this.onTap,
    super.key,
  });

  final SaleEntity sale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SaleHistoryCard(sale: sale, onTap: onTap);
  }
}
