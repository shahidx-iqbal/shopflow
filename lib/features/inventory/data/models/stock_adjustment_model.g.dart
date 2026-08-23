// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_adjustment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockAdjustmentModel _$StockAdjustmentModelFromJson(
  Map<String, dynamic> json,
) => _StockAdjustmentModel(
  id: json['id'] as String,
  productId: json['product_id'] as String,
  previousStock: (json['previous_stock'] as num).toInt(),
  newStock: (json['new_stock'] as num).toInt(),
  reason: json['reason'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$StockAdjustmentModelToJson(
  _StockAdjustmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'previous_stock': instance.previousStock,
  'new_stock': instance.newStock,
  'reason': instance.reason,
  'created_at': instance.createdAt.toIso8601String(),
};
