import 'package:freezed_annotation/freezed_annotation.dart';
part 'stock_adjustment_entity.freezed.dart';

/// A manual stock adjustment record.
@freezed
abstract class StockAdjustmentEntity with _$StockAdjustmentEntity {
  const factory StockAdjustmentEntity({
    required String id,
    required String productId,
    required int previousStock,
    required int newStock,
    required String reason,
    required DateTime createdAt,
  }) = _StockAdjustmentEntity;
}
