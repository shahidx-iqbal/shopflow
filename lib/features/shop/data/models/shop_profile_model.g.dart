// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShopProfileModel _$ShopProfileModelFromJson(Map<String, dynamic> json) =>
    _ShopProfileModel(
      shopName: json['shop_name'] as String,
      ownerName: json['owner_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      taxNumber: json['tax_number'] as String?,
      logoPath: json['logo_path'] as String?,
    );

Map<String, dynamic> _$ShopProfileModelToJson(_ShopProfileModel instance) =>
    <String, dynamic>{
      'shop_name': instance.shopName,
      'owner_name': instance.ownerName,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'tax_number': instance.taxNumber,
      'logo_path': instance.logoPath,
    };
