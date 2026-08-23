import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';

/// Base class for auth bloc states.
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required this.user});

  final UserEntity user;

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({this.hasCompletedOnboarding = false});

  final bool hasCompletedOnboarding;

  @override
  List<Object?> get props => [hasCompletedOnboarding];
}

class AuthOtpRequired extends AuthState {
  const AuthOtpRequired({required this.phone, this.debugOtp});

  final String phone;
  final String? debugOtp;

  @override
  List<Object?> get props => [phone, debugOtp];
}

class AuthPasswordResetSent extends AuthState {
  const AuthPasswordResetSent();
}

class AuthResetPasswordReady extends AuthState {
  const AuthResetPasswordReady({required this.phone});

  final String phone;

  @override
  List<Object?> get props => [phone];
}

class AuthRegistrationVerified extends AuthState {
  const AuthRegistrationVerified();
}

class AuthError extends AuthState {
  const AuthError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
