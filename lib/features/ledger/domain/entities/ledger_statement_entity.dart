import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import 'ledger_entry_entity.dart';
part 'ledger_statement_entity.freezed.dart';

/// Full ledger statement for a customer.
@freezed
abstract class LedgerStatementEntity with _$LedgerStatementEntity {
  const factory LedgerStatementEntity({
    required CustomerEntity customer,
    required List<LedgerEntryEntity> entries,
    @Default(0) double totalDebit,
    @Default(0) double totalCredit,
    @Default(0) double balance,
  }) = _LedgerStatementEntity;
}
