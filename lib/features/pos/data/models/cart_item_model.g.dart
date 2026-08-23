// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    _CartItemModel(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      barcode: json['barcode'] as String,
      unit: json['unit'] as String? ?? 'pcs',
      unitPrice: (json['unit_price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CartItemModelToJson(_CartItemModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'barcode': instance.barcode,
      'unit': instance.unit,
      'unit_price': instance.unitPrice,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'note': instance.note,
    };
