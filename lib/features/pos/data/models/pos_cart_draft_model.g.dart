// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_cart_draft_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PosCartDraftModel _$PosCartDraftModelFromJson(Map<String, dynamic> json) =>
    _PosCartDraftModel(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      saleType:
          $enumDecodeNullable(_$SaleTypeEnumMap, json['sale_type']) ??
          SaleType.cash,
      customer: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      isPartialPayment: json['is_partial_payment'] as bool? ?? false,
      cashReceived: (json['cash_received'] as num?)?.toDouble() ?? 0,
      cartDiscount: (json['cart_discount'] as num?)?.toDouble() ?? 0,
      taxEnabled: json['tax_enabled'] as bool? ?? false,
      taxRate: (json['tax_rate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$PosCartDraftModelToJson(_PosCartDraftModel instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'sale_type': _$SaleTypeEnumMap[instance.saleType]!,
      'customer': instance.customer?.toJson(),
      'is_partial_payment': instance.isPartialPayment,
      'cash_received': instance.cashReceived,
      'cart_discount': instance.cartDiscount,
      'tax_enabled': instance.taxEnabled,
      'tax_rate': instance.taxRate,
    };

const _$SaleTypeEnumMap = {SaleType.cash: 'cash', SaleType.ledger: 'ledger'};
