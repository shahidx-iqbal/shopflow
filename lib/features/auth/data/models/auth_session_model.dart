import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/auth_session_entity.dart';
import 'user_model.dart';

part 'auth_session_model.freezed.dart';
part 'auth_session_model.g.dart';

/// JSON-serializable auth session mapping to [AuthSessionEntity].
@freezed
abstract class AuthSessionModel with _$AuthSessionModel {
  const AuthSessionModel._();

  const factory AuthSessionModel({
    required String token,
    required UserModel user,
  }) = _AuthSessionModel;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);

  AuthSessionEntity toEntity() => AuthSessionEntity(
        token: token,
        user: user.toEntity(),
      );
}
