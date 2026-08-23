import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/formatters.dart';

part 'cart_item_entity.freezed.dart';

/// A single line item in the POS cart.
@freezed
abstract class CartItemEntity with _$CartItemEntity {
  const CartItemEntity._();

  const factory CartItemEntity({
    required String productId,
    required String productName,
    required String barcode,
    required String unit,
    required double unitPrice,
    required double quantity,
    @Default(0) double discount,
    String? note,
  }) = _CartItemEntity;

  double get lineGross => Formatters.roundCurrency(unitPrice * quantity);

  double get lineTotal =>
      Formatters.roundCurrency(lineGross - discount.clamp(0, lineGross));
}
