import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import 'auth_language_toggle.dart';

/// Light auth app bar — back button, centered app name, optional language toggle.
class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({
    this.showLanguageToggle = false,
    super.key,
  });

  final bool showLanguageToggle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final showBack = context.canPop();

    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: showBack
          ? IconButton(
              icon: const Icon(
                LucideIcons.arrowLeft,
                color: AppColors.textPrimary,
              ),
              onPressed: () => context.pop(),
            )
          : showLanguageToggle
              ? const SizedBox(width: kToolbarHeight)
              : null,
      title: Text(
        l10n.appName,
        style: AppTextStyles.headlineSmall.copyWith(color: AppColors.primary),
      ),
      actions: showLanguageToggle
          ? const [
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Center(child: AuthLanguageToggle()),
              ),
            ]
          : null,
    );
  }
}
