import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../models/otp_route_args.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/auth_dot_background.dart';
import '../widgets/auth_otp_input.dart';

/// OTP verification for registration or password reset.
class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({
    required this.phone,
    required this.purpose,
    this.debugOtp,
    super.key,
  });

  final String phone;
  final OtpPurpose purpose;
  final String? debugOtp;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String _otp = '';
  late String? _debugOtp = widget.debugOtp;

  @override
  void initState() {
    super.initState();
    final initial = widget.debugOtp?.replaceAll(RegExp(r'\D'), '') ?? '';
    if (initial.isNotEmpty) _otp = initial;
  }

  bool get _isComplete => _otp.length == 6;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isReset = widget.purpose == OtpPurpose.passwordReset;
    final debugOtp = _debugOtp;

    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthResetPasswordReady) {
            context.push(RouteNames.resetPassword, extra: state.phone);
          } else if (state is AuthRegistrationVerified) {
            AppSnackbar.showSuccess(context, l10n.authRegisterSuccess);
            context.go(RouteNames.login);
          } else if (state is AuthOtpRequired) {
            setState(() => _debugOtp = state.debugOtp);
            final code = state.debugOtp;
            AppSnackbar.showSuccess(
              context,
              code != null && code.isNotEmpty
                  ? l10n.otpDevCode(code)
                  : l10n.forgotPasswordSuccess,
            );
          } else if (state is AuthError) {
            AppSnackbar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          final loading = state is AuthLoading;

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: const AuthAppBar(),
            body: AuthDotBackground(
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppDimensions.pagePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: AppDimensions.space24),
                      AppCard(
                        padding: const EdgeInsets.all(AppDimensions.space24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  LucideIcons.smartphone,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: AppDimensions.space20),
                            Text(
                              isReset
                                  ? l10n.otpVerifyPhoneTitle
                                  : l10n.otpTitle,
                              style: AppTextStyles.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppDimensions.space12),
                            Text(
                              l10n.otpSentTo(widget.phone),
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.neutral,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            if (debugOtp != null && debugOtp.isNotEmpty) ...[
                              const SizedBox(height: AppDimensions.space16),
                              Container(
                                padding: const EdgeInsets.all(
                                  AppDimensions.space12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.tertiaryLight,
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radiusSmall,
                                  ),
                                ),
                                child: Text(
                                  l10n.otpDevCode(debugOtp),
                                  style: AppTextStyles.labelMedium.copyWith(
                                    color: AppColors.tertiary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                            const SizedBox(height: AppDimensions.space24),
                            AuthOtpInput(
                              key: ValueKey(debugOtp),
                              initialOtp: debugOtp,
                              onChanged: (value) =>
                                  setState(() => _otp = value),
                            ),
                            const SizedBox(height: AppDimensions.space20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  l10n.otpResendPrompt,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.neutral,
                                  ),
                                ),
                                TextButton(
                                  onPressed: loading
                                      ? null
                                      : () {
                                          if (isReset) {
                                            context.read<AuthBloc>().add(
                                                  AuthForgotPasswordEvent(
                                                    phone: widget.phone,
                                                  ),
                                                );
                                          }
                                        },
                                  child: Text(l10n.otpResendNow),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppDimensions.space8),
                            PrimaryButton(
                              label: l10n.otpVerifyButton,
                              isLoading: loading,
                              onPressed: loading || !_isComplete
                                  ? null
                                  : () {
                                      context.read<AuthBloc>().add(
                                            AuthVerifyOtpEvent(
                                              phone: widget.phone,
                                              otp: _otp,
                                              purpose: widget.purpose,
                                            ),
                                          );
                                    },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
