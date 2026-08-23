// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_recent_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardRecentTransactionModel _$DashboardRecentTransactionModelFromJson(
  Map<String, dynamic> json,
) => _DashboardRecentTransactionModel(
  id: json['id'] as String,
  customerName: json['customer_name'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  itemCount: (json['item_count'] as num).toInt(),
  status: $enumDecode(_$DashboardTransactionStatusEnumMap, json['status']),
  paymentMethod: json['payment_method'] as String?,
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$DashboardRecentTransactionModelToJson(
  _DashboardRecentTransactionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'customer_name': instance.customerName,
  'created_at': instance.createdAt.toIso8601String(),
  'item_count': instance.itemCount,
  'status': _$DashboardTransactionStatusEnumMap[instance.status]!,
  'payment_method': instance.paymentMethod,
  'amount': instance.amount,
};

const _$DashboardTransactionStatusEnumMap = {
  DashboardTransactionStatus.paid: 'paid',
  DashboardTransactionStatus.ledger: 'ledger',
};
