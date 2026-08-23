import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../customers/data/models/customer_model.dart';
import '../../domain/entities/sale_enums.dart';
import 'cart_item_model.dart';

part 'pos_cart_draft_model.freezed.dart';
part 'pos_cart_draft_model.g.dart';

/// Persisted POS cart draft for crash recovery (Section 9).
@freezed
abstract class PosCartDraftModel with _$PosCartDraftModel {
  @JsonSerializable(explicitToJson: true)
  const factory PosCartDraftModel({
    @Default([]) List<CartItemModel> items,
    @JsonKey(name: 'sale_type') @Default(SaleType.cash) SaleType saleType,
    CustomerModel? customer,
    @JsonKey(name: 'is_partial_payment') @Default(false) bool isPartialPayment,
    @JsonKey(name: 'cash_received') @Default(0) double cashReceived,
    @JsonKey(name: 'cart_discount') @Default(0) double cartDiscount,
    @JsonKey(name: 'tax_enabled') @Default(false) bool taxEnabled,
    @JsonKey(name: 'tax_rate') @Default(0) double taxRate,
  }) = _PosCartDraftModel;

  factory PosCartDraftModel.fromJson(Map<String, dynamic> json) =>
      _$PosCartDraftModelFromJson(json);
}
