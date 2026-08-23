import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../domain/entities/app_settings_entity.dart';
import '../cubit/settings_cubit.dart';

/// Shop settings screen.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _shopName = TextEditingController();
  final _lowStock = TextEditingController();
  final _receiptFooter = TextEditingController();
  bool _initialized = false;

  @override
  void dispose() {
    _shopName.dispose();
    _lowStock.dispose();
    _receiptFooter.dispose();
    super.dispose();
  }

  void _fillForm(AppSettingsEntity settings) {
    if (_initialized) return;
    _shopName.text = settings.shopName;
    _lowStock.text = settings.lowStockAlert.toString();
    _receiptFooter.text = settings.receiptFooter ?? '';
    _initialized = true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => getIt<SettingsCubit>()..loadSettings(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state.status == SettingsStatus.success) {
            AppSnackbar.showSuccess(context, l10n.settingsSaveSuccess);
          } else if (state.status == SettingsStatus.error) {
            AppSnackbar.showError(
              context,
              state.message ?? l10n.msgSomethingWentWrong,
            );
          }
        },
        builder: (context, state) {
          if (state.settings != null) {
            _fillForm(state.settings!);
          }
          return Scaffold(
            appBar: AppTopBar(
              title: l10n.settingsTitle,
              showBackButton: true,
            ),
            body: state.status == SettingsStatus.loading &&
                    state.settings == null
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(AppDimensions.pagePadding),
                    child: Column(
                      children: [
                        AppTextField(
                          label: l10n.settingsShopName,
                          controller: _shopName,
                          prefixIcon: LucideIcons.store,
                        ),
                        const SizedBox(height: AppDimensions.space16),
                        AppTextField(
                          label: l10n.settingsLowStockAlert,
                          controller: _lowStock,
                          keyboardType: TextInputType.number,
                          prefixIcon: LucideIcons.alertTriangle,
                        ),
                        const SizedBox(height: AppDimensions.space16),
                        AppTextField(
                          label: l10n.settingsReceiptFooter,
                          controller: _receiptFooter,
                          maxLines: 2,
                        ),
                        const SizedBox(height: AppDimensions.space24),
                        PrimaryButton(
                          label: l10n.btnSave,
                          isLoading: state.status == SettingsStatus.loading,
                          onPressed: () {
                            final settings = state.settings;
                            if (settings == null) return;
                            context.read<SettingsCubit>().saveSettings(
                                  settings.copyWith(
                                    shopName: _shopName.text.trim(),
                                    lowStockAlert: int.tryParse(
                                          _lowStock.text.trim(),
                                        ) ??
                                        settings.lowStockAlert,
                                    receiptFooter:
                                        _receiptFooter.text.trim().isEmpty
                                            ? null
                                            : _receiptFooter.text.trim(),
                                  ),
                                );
                          },
                        ),
                        const SizedBox(height: AppDimensions.space16),
                        PrimaryButton(
                          label: l10n.btnLogout,
                          onPressed: () {
                            getIt<AuthBloc>().add(const AuthLogoutEvent());
                            context.go('/');
                          },
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
