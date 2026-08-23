import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/utils/validation_l10n.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/customer_entity.dart';
import '../bloc/customers_bloc.dart';
import '../bloc/customers_event.dart';
import '../bloc/customers_state.dart';
import '../widgets/customer_responsive_body.dart';

/// Add or edit a ledger customer.
class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({this.customer, super.key});

  final CustomerEntity? customer;

  bool get isEditing => customer != null;

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _address;
  late final TextEditingController _notes;

  @override
  void initState() {
    super.initState();
    final c = widget.customer;
    _name = TextEditingController(text: c?.name ?? '');
    _phone = TextEditingController(text: c?.phone ?? '');
    _address = TextEditingController(text: c?.address ?? '');
    _notes = TextEditingController(text: c?.notes ?? '');
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _address.dispose();
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => getIt<CustomersBloc>(),
      child: BlocConsumer<CustomersBloc, CustomersState>(
        listener: (context, state) {
          if (state.status == CustomersStatus.success) {
            AppSnackbar.showSuccess(context, l10n.customerSaveSuccess);
            context.pop();
          } else if (state.status == CustomersStatus.error) {
            AppSnackbar.showError(
              context,
              state.message ?? l10n.msgSomethingWentWrong,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppTopBar(
              title: widget.isEditing
                  ? l10n.customerEditTitle
                  : l10n.customersAdd,
              showBackButton: true,
            ),
            body: SingleChildScrollView(
              child: CustomerResponsiveBody(
                maxWidth: 560,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.customerAddSubtitle,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.neutral,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.space24),
                      AppTextField(
                        label: l10n.customerNameLabel,
                        controller: _name,
                        prefixIcon: LucideIcons.user,
                        validator: (value) => Validators.minLength(
                          value,
                          2,
                          requiredMessage: l10n.validationCustomerNameRequired,
                          minLengthMessage: l10n.validationCustomerNameMinLength,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.space16),
                      AppTextField(
                        label: l10n.customerPhoneLabel,
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
                        label: l10n.customerAddressLabel,
                        controller: _address,
                        prefixIcon: LucideIcons.mapPin,
                        maxLines: 2,
                      ),
                      const SizedBox(height: AppDimensions.space16),
                      AppTextField(
                        label: l10n.customerNotesOptionalLabel,
                        controller: _notes,
                        prefixIcon: LucideIcons.alignLeft,
                        maxLines: 3,
                      ),
                      const SizedBox(height: AppDimensions.space32),
                      PrimaryButton(
                        label: l10n.customerSaveButton,
                        isLoading: state.status == CustomersStatus.loading,
                        onPressed: () => _save(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _save(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final entity = CustomerEntity(
      id: widget.customer?.id ?? '',
      name: _name.text.trim(),
      phone: _phone.text.trim(),
      address: _address.text.trim().isEmpty ? null : _address.text.trim(),
      notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
      balance: widget.customer?.balance ?? 0,
      createdAt: widget.customer?.createdAt ?? DateTime.now(),
    );

    final bloc = context.read<CustomersBloc>();
    if (widget.isEditing) {
      bloc.add(CustomersUpdateEvent(customer: entity));
    } else {
      bloc.add(CustomersAddEvent(customer: entity));
    }
  }
}
