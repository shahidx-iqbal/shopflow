import '../../../products/data/models/product_model.dart';
import '../models/stock_adjustment_model.dart';

abstract class InventoryDataSource {
  Future<List<ProductModel>> getInventory({bool lowStockOnly = false});
  Future<StockAdjustmentModel> adjustStock({
    required String productId,
    required int newStock,
    required String reason,
  });
}
