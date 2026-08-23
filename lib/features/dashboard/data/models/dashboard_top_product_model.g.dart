// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_top_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardTopProductModel _$DashboardTopProductModelFromJson(
  Map<String, dynamic> json,
) => _DashboardTopProductModel(
  id: json['id'] as String,
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  imageUrl: json['image_url'] as String?,
  unitsSold: (json['units_sold'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DashboardTopProductModelToJson(
  _DashboardTopProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'image_url': instance.imageUrl,
  'units_sold': instance.unitsSold,
};
