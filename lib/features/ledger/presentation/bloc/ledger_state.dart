import 'package:equatable/equatable.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../../domain/entities/ledger_statement_entity.dart';

enum LedgerStatus { initial, loading, loaded, success, error }

class LedgerState extends Equatable {
  const LedgerState({
    this.status = LedgerStatus.initial,
    this.customers = const [],
    this.statement,
    this.message,
  });
  final LedgerStatus status;
  final List<CustomerEntity> customers;
  final LedgerStatementEntity? statement;
  final String? message;

  LedgerState copyWith({
    LedgerStatus? status,
    List<CustomerEntity>? customers,
    LedgerStatementEntity? statement,
    String? message,
  }) => LedgerState(
    status: status ?? this.status,
    customers: customers ?? this.customers,
    statement: statement ?? this.statement,
    message: message,
  );

  @override
  List<Object?> get props => [status, customers, statement, message];
}
