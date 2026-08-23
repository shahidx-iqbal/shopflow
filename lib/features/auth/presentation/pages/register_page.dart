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
import '../widgets/auth_header.dart';
import '../widgets/register_logo_picker.dart';

/// New shop owner registration screen.
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _shop = TextEditingController();
  final _owner = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _address = TextEditingController();

  String? _logoPath;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _shop.dispose();
    _owner.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _address.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthBloc>().add(
          AuthRegisterEvent(
            name: _owner.text.trim(),
            shopName: _shop.text.trim(),
            phone: _phone.text.trim(),
            password: _password.text,
            address: _address.text.trim().isEmpty ? null : _address.text.trim(),
            logoPath: _logoPath,
          ),
        );
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
                purpose: OtpPurpose.registration,
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
                        const SizedBox(height: AppDimensions.space16),
                        AuthHeader(
                          title: l10n.registerTitle,
                          subtitle: l10n.registerSubtitle,
                          centered: true,
                        ),
                        const SizedBox(height: AppDimensions.space32),
                        AppCard(
                          padding: const EdgeInsets.all(AppDimensions.space24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Center(
                                child: RegisterLogoPicker(
                                  logoPath: _logoPath,
                                  onLogoChanged: (path) =>
                                      setState(() => _logoPath = path),
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space24),
                              AppTextField(
                                label: l10n.registerShopNameLabel,
                                controller: _shop,
                                prefixIcon: LucideIcons.store,
                                textInputAction: TextInputAction.next,
                                validator: (value) => Validators.minLength(
                                  value,
                                  2,
                                  requiredMessage:
                                      l10n.validationShopNameRequired,
                                  minLengthMessage:
                                      l10n.validationShopNameMinLength,
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space16),
                              AppTextField(
                                label: l10n.registerOwnerNameLabel,
                                controller: _owner,
                                prefixIcon: LucideIcons.user,
                                textInputAction: TextInputAction.next,
                                validator: (value) => Validators.minLength(
                                  value,
                                  2,
                                  requiredMessage:
                                      l10n.validationOwnerNameRequired,
                                  minLengthMessage:
                                      l10n.validationOwnerNameMinLength,
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space16),
                              AppTextField(
                                label: l10n.registerPhoneLabel,
                                controller: _phone,
                                prefixIcon: LucideIcons.phone,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                validator: (value) => Validators.phone(
                                  value,
                                  messages: l10n.phoneValidationMessages,
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space16),
                              AppTextField(
                                label: l10n.registerPasswordLabel,
                                controller: _password,
                                prefixIcon: LucideIcons.lock,
                                obscureText: _obscurePassword,
                                textInputAction: TextInputAction.next,
                                validator: (value) => Validators.minLength(
                                  value,
                                  6,
                                  requiredMessage:
                                      l10n.validationPasswordRequired,
                                  minLengthMessage:
                                      l10n.validationPasswordMinLength,
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
                                label: l10n.registerConfirmPasswordLabel,
                                controller: _confirmPassword,
                                prefixIcon: LucideIcons.keyRound,
                                obscureText: _obscureConfirmPassword,
                                textInputAction: TextInputAction.next,
                                validator: (value) => Validators.confirmPassword(
                                  value,
                                  _password.text,
                                  requiredMessage:
                                      l10n.validationConfirmPasswordRequired,
                                  mismatchMessage:
                                      l10n.validationPasswordMismatch,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirmPassword
                                        ? LucideIcons.eye
                                        : LucideIcons.eyeOff,
                                  ),
                                  onPressed: () => setState(
                                    () => _obscureConfirmPassword =
                                        !_obscureConfirmPassword,
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppDimensions.space16),
                              AppTextField(
                                label: l10n.registerAddressOptionalLabel,
                                controller: _address,
                                prefixIcon: LucideIcons.mapPin,
                                maxLines: 2,
                                textInputAction: TextInputAction.done,
                              ),
                              const SizedBox(height: AppDimensions.space24),
                              PrimaryButton(
                                label: l10n.registerButton,
                                isLoading: loading,
                                onPressed: loading
                                    ? null
                                    : () => _submit(context),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppDimensions.space24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.registerHaveAccount,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.neutral,
                              ),
                            ),
                            TextButton(
                              onPressed: loading
                                  ? null
                                  : () => context.go(RouteNames.login),
                              child: Text(
                                l10n.registerLoginLink,
                                style: AppTextStyles.labelMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimensions.space16),
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
