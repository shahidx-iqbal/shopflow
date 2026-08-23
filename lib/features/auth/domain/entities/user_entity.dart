import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// Authenticated shop owner / staff user.
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
    required String phone,
    String? email,
    required String shopName,
    required DateTime createdAt,
  }) = _UserEntity;
}
