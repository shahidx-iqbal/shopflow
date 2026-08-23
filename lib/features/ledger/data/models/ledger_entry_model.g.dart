// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LedgerEntryModel _$LedgerEntryModelFromJson(Map<String, dynamic> json) =>
    _LedgerEntryModel(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      saleId: json['sale_id'] as String?,
      amount: (json['amount'] as num).toDouble(),
      type: $enumDecode(_$LedgerEntryTypeEnumMap, json['type']),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$LedgerEntryModelToJson(_LedgerEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'sale_id': instance.saleId,
      'amount': instance.amount,
      'type': _$LedgerEntryTypeEnumMap[instance.type]!,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$LedgerEntryTypeEnumMap = {
  LedgerEntryType.debit: 'debit',
  LedgerEntryType.credit: 'credit',
};
