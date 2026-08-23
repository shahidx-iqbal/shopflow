import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/dialogs/app_dialog.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/layout/shell_layout.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../widgets/more_menu_group.dart';
import '../widgets/more_menu_tile.dart';

/// More tab — grouped settings-style menu matching the ShopFlow design kit.
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await AppDialog.showConfirm(
      context: context,
      title: l10n.authLogoutConfirmTitle,
      message: l10n.authLogoutConfirmMessage,
      confirmLabel: l10n.btnLogout,
      cancelLabel: l10n.btnCancel,
      isDestructive: true,
    );
    if (confirmed == true && context.mounted) {
      getIt<AuthBloc>().add(const AuthLogoutEvent());
      context.go(RouteNames.splash);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(
        title: l10n.settingsTitle,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          ShellLayout.isDesktop(context)
              ? AppDimensions.space32
              : AppDimensions.pagePadding,
          AppDimensions.space8,
          ShellLayout.isDesktop(context)
              ? AppDimensions.space32
              : AppDimensions.pagePadding,
          ShellLayout.tabContentBottomPadding(context),
        ),
        children: [
        //  Text(l10n.moreSettingsTitle, style: AppTextStyles.headlineLarge),
          const SizedBox(height: AppDimensions.space24),
          MoreMenuGroup(
            children: [
              MoreMenuTile(
                icon: LucideIcons.store,
                title: l10n.moreMenuShopProfile,
                iconColor: AppColors.primary,
                onTap: () => context.push(RouteNames.shopProfile),
              ),
              MoreMenuTile(
                icon: LucideIcons.layoutGrid,
                title: l10n.categoriesTitle,
                onTap: () => context.push(RouteNames.categoryList),
              ),
              MoreMenuTile(
                icon: LucideIcons.scale,
                title: l10n.ledgerTitle,
                iconColor: AppColors.tertiary,
                onTap: () => context.push(RouteNames.ledgerList),
              ),
              MoreMenuTile(
                icon: LucideIcons.chartBar,
                title: l10n.moreMenuReports,
                iconColor: AppColors.secondary,
                onTap: () => context.push(RouteNames.reports),
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.space16),
          MoreMenuGroup(
            children: [
              MoreMenuTile(
                icon: LucideIcons.receipt,
                title: l10n.moreMenuReceiptSettings,
                onTap: () => context.push(RouteNames.receiptSettings),
              ),
              MoreMenuTile(
                icon: LucideIcons.printer,
                title: l10n.moreMenuPrinter,
                onTap: () {
                  AppSnackbar.showInfo(context, l10n.morePrinterComingSoon);
                },
              ),
              MoreMenuTile(
                icon: LucideIcons.languages,
                title: l10n.settingsLanguage,
                onTap: () => context.push(RouteNames.language),
                showDivider: false,
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.space16),
          MoreMenuGroup(
            children: [
              MoreMenuTile(
                icon: LucideIcons.info,
                title: l10n.settingsAbout,
                onTap: () => context.push(RouteNames.about),
              ),
              MoreMenuTile(
                icon: LucideIcons.logOut,
                title: l10n.btnLogout,
                iconColor: AppColors.danger,
                titleColor: AppColors.danger,
                onTap: () => _confirmLogout(context),
                showDivider: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
