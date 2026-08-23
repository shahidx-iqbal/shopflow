import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_sale_by_id_usecase.dart';
import '../../domain/usecases/get_sales_usecase.dart';
import 'sales_history_event.dart';
import 'sales_history_state.dart';

/// Manages sales history listing and invoice detail views.
@injectable
class SalesHistoryBloc extends Bloc<SalesHistoryEvent, SalesHistoryState> {
  SalesHistoryBloc(this._getSales, this._getById) : super(const SalesHistoryState()) {
    on<SalesHistoryLoadEvent>(_onLoad);
    on<SalesHistoryLoadDetailsEvent>(_onDetails);
  }
  final GetSalesUseCase _getSales;
  final GetSaleByIdUseCase _getById;

  Future<void> _onLoad(SalesHistoryLoadEvent e, Emitter<SalesHistoryState> emit) async {
    final filter = e.filter;
    emit(state.copyWith(status: SalesHistoryStatus.loading, filter: filter));
    final r = await _getSales(GetSalesParams(filter: filter));
    r.fold(
      (f) => emit(
        state.copyWith(
          status: SalesHistoryStatus.error,
          message: f.message,
          filter: filter,
        ),
      ),
      (list) => emit(
        state.copyWith(
          status: SalesHistoryStatus.loaded,
          sales: list,
          filter: filter,
          clearMessage: true,
        ),
      ),
    );
  }

  Future<void> _onDetails(SalesHistoryLoadDetailsEvent e, Emitter<SalesHistoryState> emit) async {
    emit(state.copyWith(status: SalesHistoryStatus.loading));
    final r = await _getById(GetSaleByIdParams(id: e.id));
    r.fold(
      (f) => emit(state.copyWith(status: SalesHistoryStatus.error, message: f.message)),
      (s) => emit(state.copyWith(status: SalesHistoryStatus.loaded, selectedSale: s)),
    );
  }
}
