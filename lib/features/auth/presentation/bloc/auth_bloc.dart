import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/local_storage/shared_prefs_service.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../models/otp_route_args.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// Handles authentication flows: login, register, OTP, logout, and session check.
/// Emits [AuthState] variants consumed by auth pages.
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._loginUseCase,
    this._registerUseCase,
    this._verifyOtpUseCase,
    this._forgotPasswordUseCase,
    this._resetPasswordUseCase,
    this._logoutUseCase,
    this._prefs,
  ) : super(const AuthInitial()) {
    on<AuthCheckSessionEvent>(_onCheckSession);
    on<AuthLoginEvent>(_onLogin);
    on<AuthRegisterEvent>(_onRegister);
    on<AuthVerifyOtpEvent>(_onVerifyOtp);
    on<AuthForgotPasswordEvent>(_onForgotPassword);
    on<AuthResetPasswordEvent>(_onResetPassword);
    on<AuthLogoutEvent>(_onLogout);
    on<AuthCompleteOnboardingEvent>(_onCompleteOnboarding);
  }

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final LogoutUseCase _logoutUseCase;
  final SharedPrefsService _prefs;

  Future<void> _onCheckSession(
    AuthCheckSessionEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (_prefs.isAuthenticated) {
      final userId = _prefs.userId ?? 'local';
      emit(
        AuthAuthenticated(
          user: UserEntity(
            id: userId,
            name: '',
            phone: '',
            shopName: '',
            createdAt: DateTime.now(),
          ),
        ),
      );
      return;
    }
    emit(
      AuthUnauthenticated(
        hasCompletedOnboarding: _prefs.hasCompletedOnboarding,
      ),
    );
  }

  Future<void> _onLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _loginUseCase(
      LoginParams(identifier: event.identifier, password: event.password),
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (session) => emit(AuthAuthenticated(user: session.user)),
    );
  }

  Future<void> _onRegister(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _registerUseCase(
      RegisterParams(
        name: event.name,
        shopName: event.shopName,
        phone: event.phone,
        email: event.email,
        password: event.password,
        address: event.address,
        logoPath: event.logoPath,
      ),
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(AuthOtpRequired(phone: event.phone)),
    );
  }

  Future<void> _onVerifyOtp(
    AuthVerifyOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _verifyOtpUseCase(
      VerifyOtpParams(phone: event.phone, otp: event.otp),
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) {
        if (event.purpose == OtpPurpose.passwordReset) {
          emit(AuthResetPasswordReady(phone: event.phone));
        } else {
          emit(const AuthRegistrationVerified());
        }
      },
    );
  }

  Future<void> _onForgotPassword(
    AuthForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _forgotPasswordUseCase(
      ForgotPasswordParams(identifier: event.phone),
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (otp) => emit(AuthOtpRequired(phone: event.phone, debugOtp: otp)),
    );
  }

  Future<void> _onResetPassword(
    AuthResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await _resetPasswordUseCase(
      ResetPasswordParams(phone: event.phone, password: event.password),
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(const AuthPasswordResetSent()),
    );
  }

  Future<void> _onLogout(
    AuthLogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    await _logoutUseCase(const NoParams());
    emit(
      AuthUnauthenticated(
        hasCompletedOnboarding: _prefs.hasCompletedOnboarding,
      ),
    );
  }

  Future<void> _onCompleteOnboarding(
    AuthCompleteOnboardingEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _prefs.setHasCompletedOnboarding(value: true);
    emit(const AuthUnauthenticated(hasCompletedOnboarding: true));
  }
}
