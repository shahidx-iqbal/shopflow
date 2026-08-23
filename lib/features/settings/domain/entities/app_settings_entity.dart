import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_settings_entity.freezed.dart';

/// Shop-level application settings.
@freezed
abstract class AppSettingsEntity with _$AppSettingsEntity {
  const factory AppSettingsEntity({
    required String shopName,
    @Default('PKR') String currency,
    @Default('en') String locale,
    @Default(5) int lowStockAlert,
    String? receiptFooter,
  }) = _AppSettingsEntity;
}
