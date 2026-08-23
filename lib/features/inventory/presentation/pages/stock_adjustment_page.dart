import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/app_snackbar.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';

/// Manual stock adjustment form for a product.
class StockAdjustmentPage extends StatefulWidget {
  const StockAdjustmentPage({required this.product, super.key});

  final ProductEntity product;

  @override
  State<StockAdjustmentPage> createState() => _StockAdjustmentPageState();
}

class _StockAdjustmentPageState extends State<StockAdjustmentPage> {
  final _newStock = TextEditingController();
  final _reason = TextEditingController();

  @override
  void dispose() {
    _newStock.dispose();
    _reason.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => getIt<InventoryBloc>(),
      child: BlocConsumer<InventoryBloc, InventoryState>(
        listener: (context, state) {
          if (state.status == InventoryStatus.success) {
            AppSnackbar.showSuccess(context, l10n.inventoryAdjustSuccess);
            context.pop();
          } else if (state.status == InventoryStatus.error) {
            AppSnackbar.showError(
              context,
              state.message ?? l10n.msgSomethingWentWrong,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppTopBar(
              title: l10n.inventoryStockAdjustment,
              showBackButton: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppDimensions.pagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.name),
                  const SizedBox(height: AppDimensions.space8),
                  Text('${l10n.inventoryCurrentStock}: ${widget.product.stock}'),
                  const SizedBox(height: AppDimensions.space16),
                  AppTextField(
                    label: l10n.inventoryNewStock,
                    controller: _newStock,
                    keyboardType: TextInputType.number,
                    validator: (value) => Validators.nonNegativeInteger(
                      value,
                      requiredMessage: l10n.validationInventoryStockRequired,
                      invalidMessage: l10n.validationProductStockInvalid,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.space16),
                  AppTextField(
                    label: l10n.inventoryReasonLabel,
                    controller: _reason,
                    validator: (value) => Validators.required(
                      value,
                      errorMessage: l10n.validationInventoryReasonRequired,
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    label: l10n.btnSave,
                    isLoading: state.status == InventoryStatus.loading,
                    onPressed: () {
                      final stock = int.tryParse(_newStock.text.trim());
                      if (stock == null || _reason.text.trim().isEmpty) return;
                      context.read<InventoryBloc>().add(
                            InventoryAdjustEvent(
                              productId: widget.product.id,
                              newStock: stock,
                              reason: _reason.text.trim(),
                            ),
                          );
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
