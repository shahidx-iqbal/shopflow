import 'package:equatable/equatable.dart';

abstract class LedgerEvent extends Equatable {
  const LedgerEvent();
  @override
  List<Object?> get props => [];
}

class LedgerLoadCustomersEvent extends LedgerEvent {
  const LedgerLoadCustomersEvent();
}

class LedgerLoadStatementEvent extends LedgerEvent {
  const LedgerLoadStatementEvent({required this.customerId});
  final String customerId;
  @override
  List<Object?> get props => [customerId];
}

class LedgerRecordPaymentEvent extends LedgerEvent {
  const LedgerRecordPaymentEvent({
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
