import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_profile_entity.freezed.dart';

/// Shop profile — single source of truth shared with registration.
@freezed
abstract class ShopProfileEntity with _$ShopProfileEntity {
  const factory ShopProfileEntity({
    required String shopName,
    required String ownerName,
    required String phone,
    String? email,
    String? address,
    String? taxNumber,
    String? logoPath,
  }) = _ShopProfileEntity;
}
