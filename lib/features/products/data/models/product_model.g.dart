// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      barcode: json['barcode'] as String,
      categoryId: json['category_id'] as String,
      categoryName: json['category_name'] as String?,
      price: (json['price'] as num).toDouble(),
      costPrice: (json['cost_price'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      lowStockThreshold: (json['low_stock_threshold'] as num).toInt(),
      unit: json['unit'] as String,
      imageUrl: json['image_url'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'barcode': instance.barcode,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'price': instance.price,
      'cost_price': instance.costPrice,
      'stock': instance.stock,
      'low_stock_threshold': instance.lowStockThreshold,
      'unit': instance.unit,
      'image_url': instance.imageUrl,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
