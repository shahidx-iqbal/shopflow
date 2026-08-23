import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../domain/entities/stock_adjustment_entity.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../datasource/inventory_datasource.dart';

@LazySingleton(as: InventoryRepository)
class InventoryRepositoryImpl implements InventoryRepository {
  InventoryRepositoryImpl(this._dataSource);

  final InventoryDataSource _dataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getInventory({
    bool lowStockOnly = false,
  }) async {
    try {
      final list = await _dataSource.getInventory(lowStockOnly: lowStockOnly);
      return Right(list.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StockAdjustmentEntity>> adjustStock({
    required String productId,
    required int newStock,
    required String reason,
  }) async {
    try {
      return Right(
        (await _dataSource.adjustStock(
          productId: productId,
          newStock: newStock,
          reason: reason,
        ))
            .toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
