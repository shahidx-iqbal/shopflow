import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_entity.dart';

part 'auth_session_entity.freezed.dart';

/// Auth session containing token and user profile.
@freezed
abstract class AuthSessionEntity with _$AuthSessionEntity {
  const factory AuthSessionEntity({
    required String token,
    required UserEntity user,
  }) = _AuthSessionEntity;
}
