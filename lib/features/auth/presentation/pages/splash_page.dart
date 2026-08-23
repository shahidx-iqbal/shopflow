import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

/// Splash screen that checks session and routes to onboarding/login/dashboard.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => getIt<AuthBloc>()..add(const AuthCheckSessionEvent()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.go(RouteNames.dashboard);
          } else if (state is AuthUnauthenticated) {
            if (state.hasCompletedOnboarding) {
              context.go(RouteNames.login);
            } else {
              context.go(RouteNames.onboarding);
            }
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: AppTheme.lightStatusBarOverlayStyle,
          child: Scaffold(
            backgroundColor: AppColors.primary,
            body: Center(
              child: Text(
                l10n.appName,
                style: AppTextStyles.headlineLarge.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
