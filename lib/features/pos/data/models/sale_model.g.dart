// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaleModel _$SaleModelFromJson(Map<String, dynamic> json) => _SaleModel(
  id: json['id'] as String? ?? '',
  invoiceNumber: json['invoice_number'] as String?,
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  saleType: $enumDecode(_$SaleTypeEnumMap, json['sale_type']),
  customer: json['customer'] == null
      ? null
      : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
  paymentStatus: $enumDecode(_$PaymentStatusEnumMap, json['payment_status']),
  status: json['status'] as String? ?? 'completed',
  subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
  discount: (json['discount'] as num?)?.toDouble() ?? 0,
  tax: (json['tax'] as num?)?.toDouble() ?? 0,
  total: (json['total'] as num).toDouble(),
  cashReceived: (json['cash_received'] as num?)?.toDouble(),
  amountPaidNow: (json['amount_paid_now'] as num?)?.toDouble(),
  addedToLedger: (json['added_to_ledger'] as num?)?.toDouble(),
  refundReason: json['refund_reason'] as String?,
  refundedAt: json['refunded_at'] == null
      ? null
      : DateTime.parse(json['refunded_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$SaleModelToJson(_SaleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'sale_type': _$SaleTypeEnumMap[instance.saleType]!,
      'customer': instance.customer?.toJson(),
      'payment_status': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'status': instance.status,
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'tax': instance.tax,
      'total': instance.total,
      'cash_received': instance.cashReceived,
      'amount_paid_now': instance.amountPaidNow,
      'added_to_ledger': instance.addedToLedger,
      'refund_reason': instance.refundReason,
      'refunded_at': instance.refundedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$SaleTypeEnumMap = {SaleType.cash: 'cash', SaleType.ledger: 'ledger'};

const _$PaymentStatusEnumMap = {
  PaymentStatus.paid: 'paid',
  PaymentStatus.partiallyPaid: 'partiallyPaid',
  PaymentStatus.unpaid: 'unpaid',
};
