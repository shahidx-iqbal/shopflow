import 'package:flutter/material.dart';
import 'package:shopflow/features/products/domain/entities/product_entity.dart';

/// Optional navigation args when opening product details from POS checkout.
class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.posMode = false,
    this.onAddToCart,
  });

  final bool posMode;
  final void Function(BuildContext context, ProductEntity product)? onAddToCart;
}
