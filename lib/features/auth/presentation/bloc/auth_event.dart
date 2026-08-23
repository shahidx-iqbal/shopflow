import 'package:equatable/equatable.dart';

import '../models/otp_route_args.dart';

/// Base class for auth bloc events.
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckSessionEvent extends AuthEvent {
  const AuthCheckSessionEvent();
}

class AuthLoginEvent extends AuthEvent {
  const AuthLoginEvent({required this.identifier, required this.password});

  final String identifier;
  final String password;

  @override
  List<Object?> get props => [identifier, password];
}

class AuthRegisterEvent extends AuthEvent {
  const AuthRegisterEvent({
    required this.name,
    required this.shopName,
    required this.phone,
    this.email,
    required this.password,
    this.address,
    this.logoPath,
  });

  final String name;
  final String shopName;
  final String phone;
  final String? email;
  final String password;
  final String? address;
  final String? logoPath;

  @override
  List<Object?> get props =>
      [name, shopName, phone, email, password, address, logoPath];
}

class AuthVerifyOtpEvent extends AuthEvent {
  const AuthVerifyOtpEvent({
    required this.phone,
    required this.otp,
    required this.purpose,
  });

  final String phone;
  final String otp;
  final OtpPurpose purpose;

  @override
  List<Object?> get props => [phone, otp, purpose];
}

class AuthForgotPasswordEvent extends AuthEvent {
  const AuthForgotPasswordEvent({required this.phone});

  final String phone;

  @override
  List<Object?> get props => [phone];
}

class AuthResetPasswordEvent extends AuthEvent {
  const AuthResetPasswordEvent({
    required this.phone,
    required this.password,
  });

  final String phone;
  final String password;

  @override
  List<Object?> get props => [phone, password];
}

class AuthLogoutEvent extends AuthEvent {
  const AuthLogoutEvent();
}

class AuthCompleteOnboardingEvent extends AuthEvent {
  const AuthCompleteOnboardingEvent();
}
