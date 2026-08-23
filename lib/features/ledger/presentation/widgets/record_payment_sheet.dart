import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../bloc/ledger_bloc.dart';
import '../bloc/ledger_event.dart';
import '../bloc/ledger_state.dart';

enum _PaymentMode { full, partial }

/// Bottom sheet to record a full or partial cash payment against a ledger.
class RecordPaymentSheet extends StatefulWidget {
  const RecordPaymentSheet({
    required this.customer,
    required this.balance,
    super.key,
  });

  final CustomerEntity customer;
  final double balance;

  static Future<bool> show(
    BuildContext context, {
    required CustomerEntity customer,
    required double balance,
    required LedgerBloc ledgerBloc,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      builder: (_) => BlocProvider.value(
        value: ledgerBloc,
        child: RecordPaymentSheet(
          customer: customer,
          balance: balance,
        ),
      ),
    ).then((value) => value ?? false);
  }

  @override
  State<RecordPaymentSheet> createState() => _RecordPaymentSheetState();
}

class _RecordPaymentSheetState extends State<RecordPaymentSheet> {
  _PaymentMode _mode = _PaymentMode.full;
  late final TextEditingController _amountController;
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(
      text: _formatAmount(widget.balance),
    );
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String _formatAmount(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(2);
  }

  void _setMode(_PaymentMode mode) {
    setState(() {
      _mode = mode;
      if (mode == _PaymentMode.full) {
        _amountController.text = _formatAmount(widget.balance);
      } else {
        _amountController.clear();
      }
    });
  }

  void _confirm() {
    final amount = double.tryParse(_amountController.text.trim());
    if (amount == null || amount <= 0) return;
    if (amount > widget.balance) return;

    context.read<LedgerBloc>().add(
          LedgerRecordPaymentEvent(
            customerId: widget.customer.id,
            amount: amount,
            notes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return BlocListener<LedgerBloc, LedgerState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == LedgerStatus.success) {
          Navigator.pop(context, true);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimensions.space12),
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.space16,
                  AppDimensions.space16,
                  AppDimensions.space8,
                  AppDimensions.space12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.ledgerRecordPayment,
                        style: AppTextStyles.headlineSmall,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(LucideIcons.x),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.border),
              Padding(
                padding: const EdgeInsets.all(AppDimensions.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppDimensions.space16),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusMedium),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.customer.name,
                            style: AppTextStyles.labelMedium,
                          ),
                          const SizedBox(height: AppDimensions.space4),
                          Text(
                            l10n.ledgerOutstandingAmount(
                              Formatters.currency(widget.balance),
                            ),
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppDimensions.space24),
                    Text(
                      l10n.ledgerAmountReceived.toUpperCase(),
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.neutral,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.space8),
                    TextField(
                      controller: _amountController,
                      readOnly: _mode == _PaymentMode.full,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      style: AppTextStyles.numberLarge.copyWith(fontSize: 36),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixText: 'Rs. ',
                        prefixStyle: AppTextStyles.numberLarge.copyWith(
                          fontSize: 36,
                          color: AppColors.neutral,
                        ),
                        filled: true,
                        fillColor: AppColors.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMedium,
                          ),
                          borderSide: const BorderSide(color: AppColors.border),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMedium,
                          ),
                          borderSide: const BorderSide(color: AppColors.border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMedium,
                          ),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.space16),
                    _PaymentModeToggle(
                      mode: _mode,
                      onChanged: _setMode,
                    ),
                    const SizedBox(height: AppDimensions.space24),
                    Text(
                      l10n.ledgerPaymentMethodLabel,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.neutral,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.space12),
                    _CashMethodChip(label: l10n.ledgerPaymentMethodCash),
                    const SizedBox(height: AppDimensions.space24),
                    AppTextField(
                      label: l10n.ledgerNotesOptionalLabel,
                      controller: _notesController,
                      prefixIcon: LucideIcons.alignLeft,
                      maxLines: 2,
                    ),
                    const SizedBox(height: AppDimensions.space24),
                    BlocBuilder<LedgerBloc, LedgerState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          label: l10n.ledgerConfirmPayment,
                          icon: LucideIcons.check,
                          isLoading: state.status == LedgerStatus.loading,
                          onPressed: _confirm,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentModeToggle extends StatelessWidget {
  const _PaymentModeToggle({
    required this.mode,
    required this.onChanged,
  });

  final _PaymentMode mode;
  final ValueChanged<_PaymentMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(AppDimensions.space4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ModeChip(
              label: l10n.ledgerFullPayment,
              selected: mode == _PaymentMode.full,
              onTap: () => onChanged(_PaymentMode.full),
            ),
          ),
          Expanded(
            child: _ModeChip(
              label: l10n.ledgerPartialPayment,
              selected: mode == _PaymentMode.partial,
              onTap: () => onChanged(_PaymentMode.partial),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeChip extends StatelessWidget {
  const _ModeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.secondaryLight : Colors.transparent,
      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.space12),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.labelMedium.copyWith(
              color: selected ? AppColors.secondary : AppColors.neutral,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _CashMethodChip extends StatelessWidget {
  const _CashMethodChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.space12,
        horizontal: AppDimensions.space8,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(LucideIcons.banknote, color: AppColors.primary, size: 24),
          const SizedBox(height: AppDimensions.space4),
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
