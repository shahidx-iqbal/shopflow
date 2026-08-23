import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// JSON-serializable user model mapping to [UserEntity].
@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String name,
    required String phone,
    String? email,
    @JsonKey(name: 'shop_name') required String shopName,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        name: entity.name,
        phone: entity.phone,
        email: entity.email,
        shopName: entity.shopName,
        createdAt: entity.createdAt,
      );

  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        phone: phone,
        email: email,
        shopName: shopName,
        createdAt: createdAt,
      );
}
