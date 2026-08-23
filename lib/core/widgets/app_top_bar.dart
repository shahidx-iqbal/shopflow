import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../theme/app_theme.dart';

/// Shared app bar — primary green background, white title and icons.
///
/// Tab-root screens: [showBackButton] false, title only or with [actions].
/// Pushed detail screens: [showBackButton] true.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    required this.title,
    this.showBackButton = false,
    this.actions = const [],
    this.onBack,
    super.key,
  });

  final String title;
  final bool showBackButton;
  final List<Widget> actions;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final showBack = showBackButton && context.canPop();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.lightStatusBarOverlayStyle,
      child: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: showBack
            ? IconButton(
                icon: const Icon(LucideIcons.arrowLeft),
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                onPressed: onBack ?? () => context.pop(),
              )
            : null,
        title: Text(
          title,
          style: AppTextStyles.headlineSmall.copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        actions: actions,
      ),
    );
  }
}
