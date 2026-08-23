import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/stock_adjustment_entity.dart';
import '../repositories/inventory_repository.dart';

/// Manually adjusts product stock with a reason.
@injectable
class AdjustStockUseCase
    implements UseCase<StockAdjustmentEntity, AdjustStockParams> {
  AdjustStockUseCase(this._repository);
  final InventoryRepository _repository;
  @override
  Future<Either<Failure, StockAdjustmentEntity>> call(AdjustStockParams params) =>
      _repository.adjustStock(
        productId: params.productId,
        newStock: params.newStock,
        reason: params.reason,
      );
}
class AdjustStockParams extends Equatable {
  const AdjustStockParams({
    required this.productId,
    required this.newStock,
    required this.reason,
  });
  final String productId;
  final int newStock;
  final String reason;
  @override
  List<Object?> get props => [productId, newStock, reason];
}
