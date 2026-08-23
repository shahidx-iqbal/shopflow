import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_ledger_customers_usecase.dart';
import '../../domain/usecases/get_ledger_statement_usecase.dart';
import '../../domain/usecases/record_payment_usecase.dart';
import 'ledger_event.dart';
import 'ledger_state.dart';

/// Manages ledger customer list, statements, and payment recording.
@injectable
class LedgerBloc extends Bloc<LedgerEvent, LedgerState> {
  LedgerBloc(this._getCustomers, this._getStatement, this._recordPayment)
      : super(const LedgerState()) {
    on<LedgerLoadCustomersEvent>(_onLoadCustomers);
    on<LedgerLoadStatementEvent>(_onLoadStatement);
    on<LedgerRecordPaymentEvent>(_onRecordPayment);
  }

  final GetLedgerCustomersUseCase _getCustomers;
  final GetLedgerStatementUseCase _getStatement;
  final RecordPaymentUseCase _recordPayment;

  Future<void> _onLoadCustomers(LedgerLoadCustomersEvent e, Emitter<LedgerState> emit) async {
    emit(state.copyWith(status: LedgerStatus.loading));
    final r = await _getCustomers(const NoParams());
    r.fold(
      (f) => emit(state.copyWith(status: LedgerStatus.error, message: f.message)),
      (list) => emit(state.copyWith(status: LedgerStatus.loaded, customers: list)),
    );
  }

  Future<void> _onLoadStatement(LedgerLoadStatementEvent e, Emitter<LedgerState> emit) async {
    emit(state.copyWith(status: LedgerStatus.loading));
    final r = await _getStatement(GetLedgerStatementParams(customerId: e.customerId));
    r.fold(
      (f) => emit(state.copyWith(status: LedgerStatus.error, message: f.message)),
      (s) => emit(state.copyWith(status: LedgerStatus.loaded, statement: s)),
    );
  }

  Future<void> _onRecordPayment(LedgerRecordPaymentEvent e, Emitter<LedgerState> emit) async {
    emit(state.copyWith(status: LedgerStatus.loading));
    final r = await _recordPayment(RecordPaymentParams(
      customerId: e.customerId, amount: e.amount, notes: e.notes,
    ));
    r.fold(
      (f) => emit(state.copyWith(status: LedgerStatus.error, message: f.message)),
      (_) {
        emit(state.copyWith(status: LedgerStatus.success));
        add(LedgerLoadStatementEvent(customerId: e.customerId));
      },
    );
  }
}
