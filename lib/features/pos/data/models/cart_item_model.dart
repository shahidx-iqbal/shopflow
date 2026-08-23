import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cart_item_entity.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
abstract class CartItemModel with _$CartItemModel {
  const CartItemModel._();

  const factory CartItemModel({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    required String barcode,
    @Default('pcs') String unit,
    @JsonKey(name: 'unit_price') required double unitPrice,
    required double quantity,
    @Default(0) double discount,
    String? note,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  factory CartItemModel.fromEntity(CartItemEntity e) => CartItemModel(
        productId: e.productId,
        productName: e.productName,
        barcode: e.barcode,
        unit: e.unit,
        unitPrice: e.unitPrice,
        quantity: e.quantity,
        discount: e.discount,
        note: e.note,
      );

  CartItemEntity toEntity() => CartItemEntity(
        productId: productId,
        productName: productName,
        barcode: barcode,
        unit: unit,
        unitPrice: unitPrice,
        quantity: quantity,
        discount: discount,
        note: note,
      );
}
