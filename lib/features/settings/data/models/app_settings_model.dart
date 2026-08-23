import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/app_settings_entity.dart';
part 'app_settings_model.freezed.dart';
part 'app_settings_model.g.dart';

@freezed
abstract class AppSettingsModel with _$AppSettingsModel {
  const AppSettingsModel._();
  const factory AppSettingsModel({
    @JsonKey(name: 'shop_name') required String shopName,
    @Default('PKR') String currency,
    @Default('en') String locale,
    @JsonKey(name: 'low_stock_alert') @Default(5) int lowStockAlert,
    @JsonKey(name: 'receipt_footer') String? receiptFooter,
  }) = _AppSettingsModel;
  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);
  factory AppSettingsModel.fromEntity(AppSettingsEntity e) => AppSettingsModel(
    shopName: e.shopName, currency: e.currency, locale: e.locale,
    lowStockAlert: e.lowStockAlert, receiptFooter: e.receiptFooter);
  AppSettingsEntity toEntity() => AppSettingsEntity(
    shopName: shopName, currency: currency, locale: locale,
    lowStockAlert: lowStockAlert, receiptFooter: receiptFooter);
}
