import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../customers/data/models/customer_model.dart';
import '../../domain/entities/ledger_statement_entity.dart';
import 'ledger_entry_model.dart';
part 'ledger_statement_model.freezed.dart';
part 'ledger_statement_model.g.dart';

@freezed
abstract class LedgerStatementModel with _$LedgerStatementModel {
  const LedgerStatementModel._();
  const factory LedgerStatementModel({
    required CustomerModel customer,
    required List<LedgerEntryModel> entries,
    @JsonKey(name: 'total_debit') @Default(0) double totalDebit,
    @JsonKey(name: 'total_credit') @Default(0) double totalCredit,
    @Default(0) double balance,
  }) = _LedgerStatementModel;
  factory LedgerStatementModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerStatementModelFromJson(json);
  LedgerStatementEntity toEntity() => LedgerStatementEntity(
    customer: customer.toEntity(),
    entries: entries.map((e) => e.toEntity()).toList(),
    totalDebit: totalDebit, totalCredit: totalCredit, balance: balance);
}
