import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/ledger_entry_entity.dart';
import '../repositories/ledger_repository.dart';

/// Records a credit payment against a customer's ledger balance.
@injectable
class RecordPaymentUseCase
    implements UseCase<LedgerEntryEntity, RecordPaymentParams> {
  RecordPaymentUseCase(this._repository);
  final LedgerRepository _repository;
  @override
  Future<Either<Failure, LedgerEntryEntity>> call(RecordPaymentParams params) =>
      _repository.recordPayment(
        customerId: params.customerId,
        amount: params.amount,
        notes: params.notes,
      );
}
class RecordPaymentParams extends Equatable {
  const RecordPaymentParams({
    required this.customerId,
    required this.amount,
    this.notes,
  });
  final String customerId;
  final double amount;
  final String? notes;
  @override
  List<Object?> get props => [customerId, amount, notes];
}
