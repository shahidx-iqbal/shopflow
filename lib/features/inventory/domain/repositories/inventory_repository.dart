import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../entities/stock_adjustment_entity.dart';

/// Contract for inventory listing and stock adjustments.
abstract class InventoryRepository {
  Future<Either<Failure, List<ProductEntity>>> getInventory({bool lowStockOnly = false});
  Future<Either<Failure, StockAdjustmentEntity>> adjustStock({
    required String productId,
    required int newStock,
    required String reason,
  });
}
