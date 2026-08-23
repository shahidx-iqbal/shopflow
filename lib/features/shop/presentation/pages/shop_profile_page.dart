import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/validation_l10n.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../core/widgets/states/error_state_widget.dart';
import '../../../../core/widgets/states/loading_widget.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/shop_profile_entity.dart';
import '../cubit/shop_profile_cubit.dart';
import '../widgets/shop_logo_picker.dart';

/// Shop profile editor — loads via [ShopProfileCubit], saves to [ShopRepository].
class ShopProfilePage extends StatefulWidget {
  const ShopProfilePage({super.key});

  @override
  State<ShopProfilePage> createState() => _ShopProfilePageState();
}

class _ShopProfilePageState extends State<ShopProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _shopName = TextEditingController();
  final _ownerName = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _taxNumber = TextEditingController();
  String? _logoPath;
  bool _initialized = false;

  @override
  void dispose() {
    _shopName.dispose();
    _ownerName.dispose();
    _phone.dispose();
    _email.dispose();
    _address.dispose();
    _taxNumber.dispose();
    super.dispose();
  }

  void _fillForm(ShopProfileEntity profile) {
    if (_initialized) return;
    _shopName.text = profile.shopName;
    _ownerName.text = profile.ownerName;
    _phone.text = profile.phone;
    _email.text = profile.email ?? '';
    _address.text = profile.address ?? '';
    _taxNumber.text = profile.taxNumber ?? '';
    _logoPath = profile.logoPath;
    _initialized = true;
  }

  ShopProfileEntity _buildEntity() => ShopProfileEntity(
        shopName: _shopName.text.trim(),
        ownerName: _ownerName.text.trim(),
        phone: _phone.text.trim(),
        email: _email.text.trim().isEmpty ? null : _email.text.trim(),
        address: _address.text.trim().isEmpty ? null : _address.text.trim(),
        taxNumber: _taxNumber.text.trim().isEmpty ? null : _taxNumber.text.trim(),
        logoPath: _logoPath,
      );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => getIt<ShopProfileCubit>()..loadProfile(),
      child: BlocConsumer<ShopProfileCubit, ShopProfileState>(
        listener: (context, state) async {
          if (state.status == ShopProfileStatus.loaded &&
              state.profile != null) {
            _fillForm(state.profile!);
          }
        },
        builder: (context, state) {
          if (state.status == ShopProfileStatus.loading &&
              state.profile == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.moreMenuShopProfile,
                showBackButton: true,
              ),
              body: const LoadingWidget(),
            );
          }
          if (state.status == ShopProfileStatus.error &&
              state.profile == null) {
            return Scaffold(
              appBar: AppTopBar(
                title: l10n.moreMenuShopProfile,
                showBackButton: true,
              ),
              body: ErrorStateWidget(
                message: state.message ?? l10n.msgSomethingWentWrong,
                retryLabel: l10n.btnRetry,
                onRetry: () => context.read<ShopProfileCubit>().loadProfile(),
              ),
            );
          }

          return Scaffold(
            appBar: AppTopBar(
              title: l10n.moreMenuShopProfile,
              showBackButton: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimensions.pagePadding),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ShopLogoPicker(
                      logoPath: _logoPath,
                      onLogoChanged: (path) => setState(() => _logoPath = path),
                    ),
                    const SizedBox(height: AppDimensions.space24),
                    AppTextField(
                      label: l10n.registerShopNameLabel,
                      controller: _shopName,
                      prefixIcon: LucideIcons.store,
                      validator: (value) => Validators.required(
                        value,
                        errorMessage: l10n.validationShopNameRequired,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.space16),
                    AppTextField(
                      label: l10n.registerNameLabel,
                      controller: _ownerName,
                      prefixIcon: LucideIcons.user,
                      validator: (value) => Validators.required(
                        value,
                        errorMessage: l10n.validationFullNameRequired,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.space16),
                    AppTextField(
                      label: l10n.registerPhoneLabel,
                      controller: _phone,
                      prefixIcon: LucideIcons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) => Validators.phone(
                        value,
                        messages: l10n.phoneValidationMessages,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.space16),
                    AppTextField(
                      label: l10n.registerEmailLabel,
                      controller: _email,
                      prefixIcon: LucideIcons.mail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: AppDimensions.space16),
                    AppTextField(
                      label: l10n.shopProfileAddressLabel,
                      controller: _address,
                      prefixIcon: LucideIcons.mapPin,
                      maxLines: 2,
                    ),
                    const SizedBox(height: AppDimensions.space16),
                    AppTextField(
                      label: l10n.shopProfileTaxNumberLabel,
                      controller: _taxNumber,
                      prefixIcon: LucideIcons.fileText,
                    ),
                    const SizedBox(height: AppDimensions.space24),
                    PrimaryButton(
                      label: l10n.shopProfileSaveChanges,
                      isLoading: state.status == ShopProfileStatus.saving,
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;
                        final ok = await context
                            .read<ShopProfileCubit>()
                            .saveProfile(_buildEntity());
                        if (ok && context.mounted) {
                          AppSnackbar.showSuccess(
                            context,
                            l10n.settingsSaveSuccess,
                          );
                        }
                      },
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
