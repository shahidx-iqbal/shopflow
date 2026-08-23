import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/utils/validation_l10n.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../models/otp_route_args.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/auth_dot_background.dart';

/// Forgot password — step 1: request OTP via phone number.
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthOtpRequired) {
            context.push(
              RouteNames.otpVerification,
              extra: OtpRouteArgs(
                phone: state.phone,
                purpose: OtpPurpose.passwordReset,
                debugOtp: state.debugOtp,
              ),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppDimensions.space24),
                        AppCard(
                          padding: const EdgeInsets.all(AppDimensions.space24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                l10n.forgotPasswordTitle,
                                style: AppTextStyles.headlineSmall.copyWith(
                                  color: AppColors.primary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppDimensions.space12),
                              Text(
                                l10n.forgotPasswordSubtitle,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.neutral,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppDimensions.space24),
                              AppTextField(
                                label: l10n.registerPhoneLabel,
                                controller: _phoneController,
                                prefixIcon: LucideIcons.phone,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.done,
                                validator: (value) => Validators.phone(
                                  value,
                                  messages: l10n.phoneValidationMessages,
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space24),
                              PrimaryButton(
                                label: l10n.forgotPasswordButton,
                                trailingIcon: LucideIcons.arrowRight,
                                isLoading: loading,
                                onPressed: loading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<AuthBloc>().add(
                                                AuthForgotPasswordEvent(
                                                  phone: _phoneController.text
                                                      .trim(),
                                                ),
                                              );
                                        }
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
            ),
          );
        },
      ),
    );
  }
}
