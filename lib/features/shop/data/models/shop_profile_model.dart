import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shop_profile_entity.dart';

part 'shop_profile_model.freezed.dart';
part 'shop_profile_model.g.dart';

@freezed
abstract class ShopProfileModel with _$ShopProfileModel {
  const ShopProfileModel._();

  const factory ShopProfileModel({
    @JsonKey(name: 'shop_name') required String shopName,
    @JsonKey(name: 'owner_name') required String ownerName,
    required String phone,
    String? email,
    String? address,
    @JsonKey(name: 'tax_number') String? taxNumber,
    @JsonKey(name: 'logo_path') String? logoPath,
  }) = _ShopProfileModel;

  factory ShopProfileModel.fromJson(Map<String, dynamic> json) {
    final mapped = Map<String, dynamic>.from(json);
    mapped['logo_path'] ??= json['logo_url'] ?? json['logo'];
    return _$ShopProfileModelFromJson(mapped);
  }

  factory ShopProfileModel.fromEntity(ShopProfileEntity entity) =>
      ShopProfileModel(
        shopName: entity.shopName,
        ownerName: entity.ownerName,
        phone: entity.phone,
        email: entity.email,
        address: entity.address,
        taxNumber: entity.taxNumber,
        logoPath: entity.logoPath,
      );

  ShopProfileEntity toEntity() => ShopProfileEntity(
        shopName: shopName,
        ownerName: ownerName,
        phone: phone,
        email: email,
        address: address,
        taxNumber: taxNumber,
        logoPath: logoPath,
      );
}
