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
import '../../../../core/widgets/cards/app_card.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/auth_brand_header.dart';
import '../widgets/auth_dot_background.dart';

/// Email/phone + password login screen.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            AppSnackbar.showSuccess(context, l10n.authLoginSuccess);
            context.go(RouteNames.dashboard);
          } else if (state is AuthError) {
            AppSnackbar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          final loading = state is AuthLoading;

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: const AuthAppBar(showLanguageToggle: true),
            body: AuthDotBackground(
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppDimensions.pagePadding),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppDimensions.space8),
                        AppCard(
                          padding: const EdgeInsets.all(AppDimensions.space24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const AuthBrandHeader(),
                              const SizedBox(height: AppDimensions.space32),
                              Text(
                                l10n.loginTitle,
                                style: AppTextStyles.headlineSmall,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppDimensions.space8),
                              Text(
                                l10n.loginSubtitle,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.neutral,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppDimensions.space24),
                              AppTextField(
                                label: l10n.loginEmailLabel,
                                controller: _identifierController,
                                prefixIcon: LucideIcons.mail,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: (v) => Validators.required(
                                  v,
                                  errorMessage:
                                      l10n.validationLoginIdentifierRequired,
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space16),
                              AppTextField(
                                label: l10n.loginPasswordLabel,
                                controller: _passwordController,
                                prefixIcon: LucideIcons.lock,
                                obscureText: _obscure,
                                validator: (v) => Validators.minLength(
                                  v,
                                  6,
                                  requiredMessage:
                                      l10n.validationPasswordRequired,
                                  minLengthMessage:
                                      l10n.validationPasswordMinLength,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscure
                                        ? LucideIcons.eye
                                        : LucideIcons.eyeOff,
                                  ),
                                  onPressed: () =>
                                      setState(() => _obscure = !_obscure),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButton(
                                  onPressed: loading
                                      ? null
                                      : () => context.push(
                                            RouteNames.forgotPassword,
                                          ),
                                  child: Text(l10n.loginForgotPassword),
                                ),
                              ),
                              PrimaryButton(
                                label: l10n.loginButton,
                                isLoading: loading,
                                onPressed: loading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<AuthBloc>().add(
                                                AuthLoginEvent(
                                                  identifier:
                                                      _identifierController.text
                                                          .trim(),
                                                  password:
                                                      _passwordController.text,
                                                ),
                                              );
                                        }
                                      },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppDimensions.space24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.loginNoAccount,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.neutral,
                              ),
                            ),
                            TextButton(
                              onPressed: loading
                                  ? null
                                  : () => context.push(RouteNames.register),
                              child: Text(
                                l10n.loginRegisterLink,
                                style: AppTextStyles.labelMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
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
