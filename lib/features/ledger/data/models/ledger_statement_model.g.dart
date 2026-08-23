// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LedgerStatementModel _$LedgerStatementModelFromJson(
  Map<String, dynamic> json,
) => _LedgerStatementModel(
  customer: CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
  entries: (json['entries'] as List<dynamic>)
      .map((e) => LedgerEntryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalDebit: (json['total_debit'] as num?)?.toDouble() ?? 0,
  totalCredit: (json['total_credit'] as num?)?.toDouble() ?? 0,
  balance: (json['balance'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$LedgerStatementModelToJson(
  _LedgerStatementModel instance,
) => <String, dynamic>{
  'customer': instance.customer,
  'entries': instance.entries,
  'total_debit': instance.totalDebit,
  'total_credit': instance.totalCredit,
  'balance': instance.balance,
};
