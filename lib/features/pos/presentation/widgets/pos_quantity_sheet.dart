import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/enums/unit_type.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../bloc/pos_event.dart';

/// Bottom sheet for weighted / loose goods — By Weight or By Amount entry.
class PosQuantitySheet extends StatefulWidget {
  const PosQuantitySheet({
    required this.product,
    this.initialQuantity,
    super.key,
  });

  final ProductEntity product;
  final double? initialQuantity;

  static Future<PosAddProductWithQuantityEvent?> show(
    BuildContext context, {
    required ProductEntity product,
    double? initialQuantity,
  }) {
    return showModalBottomSheet<PosAddProductWithQuantityEvent>(
      context: context,
      isScrollControlled: true,
      builder: (_) => PosQuantitySheet(
        product: product,
        initialQuantity: initialQuantity,
      ),
    );
  }

  @override
  State<PosQuantitySheet> createState() => _PosQuantitySheetState();
}

class _PosQuantitySheetState extends State<PosQuantitySheet> {
  late PosQuantityInputMode _mode;
  late TextEditingController _valueController;

  UnitType get _unit => UnitType.fromString(widget.product.unit);

  @override
  void initState() {
    super.initState();
    _mode = PosQuantityInputMode.byWeight;
    final prefill = widget.initialQuantity;
    _valueController = TextEditingController(
      text: prefill != null && prefill > 0 ? prefill.toString() : '',
    );
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  void _submit() {
    final parsed = double.tryParse(_valueController.text.trim());
    if (parsed == null || parsed <= 0) return;

    Navigator.of(context).pop(
      PosAddProductWithQuantityEvent(
        product: widget.product,
        quantity: _mode == PosQuantityInputMode.byWeight ? parsed : 0,
        mode: _mode,
        amount: _mode == PosQuantityInputMode.byAmount ? parsed : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.pagePadding,
        AppDimensions.space16,
        AppDimensions.pagePadding,
        AppDimensions.space16 + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.product.name, style: AppTextStyles.headlineSmall),
          const SizedBox(height: AppDimensions.space4),
          Text(
            '${Formatters.currency(widget.product.price)} / ${_unit.label}',
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral),
          ),
          const SizedBox(height: AppDimensions.space16),
          SegmentedButton<PosQuantityInputMode>(
            segments: [
              ButtonSegment(
                value: PosQuantityInputMode.byWeight,
                label: Text(l10n.posQuantityByWeight),
              ),
              ButtonSegment(
                value: PosQuantityInputMode.byAmount,
                label: Text(l10n.posQuantityByAmount),
              ),
            ],
            selected: {_mode},
            onSelectionChanged: (selection) {
              setState(() => _mode = selection.first);
            },
          ),
          const SizedBox(height: AppDimensions.space16),
          TextField(
            controller: _valueController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            autofocus: true,
            decoration: InputDecoration(
              labelText: _mode == PosQuantityInputMode.byWeight
                  ? l10n.posQuantityLabel(_unit.label)
                  : l10n.posAmountLabel,
              border: const OutlineInputBorder(),
            ),
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: AppDimensions.space16),
          PrimaryButton(
            label: l10n.posAddToCart,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
