import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/ledger_entry_entity.dart';
part 'ledger_entry_model.freezed.dart';
part 'ledger_entry_model.g.dart';

@freezed
abstract class LedgerEntryModel with _$LedgerEntryModel {
  const LedgerEntryModel._();
  const factory LedgerEntryModel({
    required String id,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'sale_id') String? saleId,
    required double amount,
    required LedgerEntryType type,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _LedgerEntryModel;
  factory LedgerEntryModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerEntryModelFromJson(json);
  LedgerEntryEntity toEntity() => LedgerEntryEntity(
    id: id, customerId: customerId, saleId: saleId, amount: amount,
    type: type, notes: notes, createdAt: createdAt);
}
