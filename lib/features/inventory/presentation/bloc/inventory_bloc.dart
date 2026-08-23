import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/adjust_stock_usecase.dart';
import '../../domain/usecases/get_inventory_usecase.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';

/// Manages inventory listing and stock adjustment flows.
@injectable
class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc(this._getInventory, this._adjustStock) : super(const InventoryState()) {
    on<InventoryLoadEvent>(_onLoad);
    on<InventoryAdjustEvent>(_onAdjust);
  }
  final GetInventoryUseCase _getInventory;
  final AdjustStockUseCase _adjustStock;

  Future<void> _onLoad(InventoryLoadEvent e, Emitter<InventoryState> emit) async {
    emit(state.copyWith(status: InventoryStatus.loading));
    final r = await _getInventory(GetInventoryParams(lowStockOnly: e.lowStockOnly));
    r.fold(
      (f) => emit(state.copyWith(status: InventoryStatus.error, message: f.message)),
      (list) => emit(state.copyWith(status: InventoryStatus.loaded, items: list)),
    );
  }

  Future<void> _onAdjust(InventoryAdjustEvent e, Emitter<InventoryState> emit) async {
    emit(state.copyWith(status: InventoryStatus.loading));
    final r = await _adjustStock(AdjustStockParams(
      productId: e.productId, newStock: e.newStock, reason: e.reason,
    ));
    r.fold(
      (f) => emit(state.copyWith(status: InventoryStatus.error, message: f.message)),
      (_) {
        emit(state.copyWith(status: InventoryStatus.success));
        add(const InventoryLoadEvent());
      },
    );
  }
}
