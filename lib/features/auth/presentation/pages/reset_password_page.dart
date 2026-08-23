import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/auth_dot_background.dart';
import '../widgets/password_requirements_panel.dart';

/// Reset password — step 3 after OTP verification.
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({required this.phone, super.key});

  final String phone;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthPasswordResetSent) {
            AppSnackbar.showSuccess(context, l10n.resetPasswordSuccess);
            context.go(RouteNames.login);
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(AppDimensions.pagePadding),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: AppDimensions.space8),
                              Text(
                                l10n.resetPasswordTitle,
                                style: AppTextStyles.headlineLarge,
                              ),
                              const SizedBox(height: AppDimensions.space8),
                              Text(
                                l10n.resetPasswordSubtitle,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.neutral,
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space32),
                              AppTextField(
                                label: l10n.resetPasswordNewLabel,
                                hint: l10n.resetPasswordNewHint,
                                controller: _password,
                                prefixIcon: LucideIcons.lock,
                                obscureText: _obscurePassword,
                                onChanged: (_) => setState(() {}),
                                validator: (value) => Validators.strongPassword(
                                  value,
                                  requiredMessage:
                                      l10n.validationResetPasswordRequired,
                                  invalidMessage:
                                      l10n.validationResetPasswordInvalid,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? LucideIcons.eye
                                        : LucideIcons.eyeOff,
                                  ),
                                  onPressed: () => setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space16),
                              AppTextField(
                                label: l10n.resetPasswordConfirmLabel,
                                hint: l10n.resetPasswordConfirmHint,
                                controller: _confirmPassword,
                                prefixIcon: LucideIcons.keyRound,
                                obscureText: _obscureConfirm,
                                validator: (value) => Validators.confirmPassword(
                                  value,
                                  _password.text,
                                  requiredMessage: l10n
                                      .validationResetPasswordConfirmRequired,
                                  mismatchMessage:
                                      l10n.validationPasswordMismatch,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirm
                                        ? LucideIcons.eye
                                        : LucideIcons.eyeOff,
                                  ),
                                  onPressed: () => setState(
                                    () => _obscureConfirm = !_obscureConfirm,
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space20),
                              PasswordRequirementsPanel(
                                password: _password.text,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppDimensions.pagePadding),
                      child: PrimaryButton(
                        label: l10n.resetPasswordButton,
                        isLoading: loading,
                        onPressed: loading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                        AuthResetPasswordEvent(
                                          phone: widget.phone,
                                          password: _password.text,
                                        ),
                                      );
                                }
                              },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
