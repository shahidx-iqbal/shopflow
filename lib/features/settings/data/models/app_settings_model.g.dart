// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) =>
    _AppSettingsModel(
      shopName: json['shop_name'] as String,
      currency: json['currency'] as String? ?? 'PKR',
      locale: json['locale'] as String? ?? 'en',
      lowStockAlert: (json['low_stock_alert'] as num?)?.toInt() ?? 5,
      receiptFooter: json['receipt_footer'] as String?,
    );

Map<String, dynamic> _$AppSettingsModelToJson(_AppSettingsModel instance) =>
    <String, dynamic>{
      'shop_name': instance.shopName,
      'currency': instance.currency,
      'locale': instance.locale,
      'low_stock_alert': instance.lowStockAlert,
      'receipt_footer': instance.receiptFooter,
    };
