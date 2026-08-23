import 'package:freezed_annotation/freezed_annotation.dart';
part 'ledger_entry_entity.freezed.dart';

enum LedgerEntryType { debit, credit }

/// A single debit/credit entry on a customer ledger.
@freezed
abstract class LedgerEntryEntity with _$LedgerEntryEntity {
  const factory LedgerEntryEntity({
    required String id,
    required String customerId,
    String? saleId,
    required double amount,
    required LedgerEntryType type,
    String? notes,
    required DateTime createdAt,
  }) = _LedgerEntryEntity;
}
