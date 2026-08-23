import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/stock_adjustment_entity.dart';
part 'stock_adjustment_model.freezed.dart';
part 'stock_adjustment_model.g.dart';

@freezed
abstract class StockAdjustmentModel with _$StockAdjustmentModel {
  const StockAdjustmentModel._();
  const factory StockAdjustmentModel({
    required String id,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'previous_stock') required int previousStock,
    @JsonKey(name: 'new_stock') required int newStock,
    required String reason,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _StockAdjustmentModel;
  factory StockAdjustmentModel.fromJson(Map<String, dynamic> json) =>
      _$StockAdjustmentModelFromJson(json);
  StockAdjustmentEntity toEntity() => StockAdjustmentEntity(
    id: id, productId: productId, previousStock: previousStock,
    newStock: newStock, reason: reason, createdAt: createdAt);
}
