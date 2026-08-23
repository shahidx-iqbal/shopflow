import '../../domain/entities/product_entity.dart';

enum ProductStockStatus { inStock, lowStock, outOfStock }

/// Derives stock badge state from product quantities.
class ProductStockHelper {
  ProductStockHelper._();

  static ProductStockStatus status(ProductEntity product) {
    if (product.stock <= 0) return ProductStockStatus.outOfStock;
    if (product.stock <= product.lowStockThreshold) {
      return ProductStockStatus.lowStock;
    }
    return ProductStockStatus.inStock;
  }

  static double stockProgress(ProductEntity product) {
    if (product.lowStockThreshold <= 0) return 1;
    final target = product.lowStockThreshold * 3;
    return (product.stock / target).clamp(0.0, 1.0);
  }
}
