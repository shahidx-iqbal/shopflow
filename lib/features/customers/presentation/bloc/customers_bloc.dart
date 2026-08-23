import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/add_customer_usecase.dart';
import '../../domain/usecases/delete_customer_usecase.dart';
import '../../domain/usecases/get_customer_by_id_usecase.dart';
import '../../domain/usecases/get_customers_usecase.dart';
import '../../domain/usecases/update_customer_usecase.dart';
import 'customers_event.dart';
import 'customers_state.dart';

/// Manages ledger customer listing, create, update, and detail flows.
@injectable
class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  CustomersBloc(
    this._getCustomers,
    this._getById,
    this._add,
    this._update,
    this._delete,
  ) : super(const CustomersState()) {
    on<CustomersLoadEvent>(_onLoad);
    on<CustomersAddEvent>(_onAdd);
    on<CustomersUpdateEvent>(_onUpdate);
    on<CustomersLoadDetailsEvent>(_onDetails);
    on<CustomersDeleteEvent>(_onDelete);
  }

  final GetCustomersUseCase _getCustomers;
  final GetCustomerByIdUseCase _getById;
  final AddCustomerUseCase _add;
  final UpdateCustomerUseCase _update;
  final DeleteCustomerUseCase _delete;

  Future<void> _onLoad(CustomersLoadEvent e, Emitter<CustomersState> emit) async {
    emit(state.copyWith(status: CustomersStatus.loading));
    final r = await _getCustomers(GetCustomersParams(query: e.query));
    r.fold(
      (f) => emit(state.copyWith(status: CustomersStatus.error, message: f.message)),
      (list) => emit(state.copyWith(status: CustomersStatus.loaded, customers: list)),
    );
  }

  Future<void> _onAdd(CustomersAddEvent e, Emitter<CustomersState> emit) async {
    emit(state.copyWith(status: CustomersStatus.loading));
    final r = await _add(e.customer);
    r.fold(
      (f) => emit(state.copyWith(status: CustomersStatus.error, message: f.message)),
      (_) {
        emit(state.copyWith(status: CustomersStatus.success));
        add(const CustomersLoadEvent());
      },
    );
  }

  Future<void> _onUpdate(
    CustomersUpdateEvent e,
    Emitter<CustomersState> emit,
  ) async {
    emit(state.copyWith(status: CustomersStatus.loading));
    final r = await _update(e.customer);
    r.fold(
      (f) => emit(state.copyWith(status: CustomersStatus.error, message: f.message)),
      (_) {
        emit(state.copyWith(status: CustomersStatus.success));
        add(const CustomersLoadEvent());
      },
    );
  }

  Future<void> _onDetails(CustomersLoadDetailsEvent e, Emitter<CustomersState> emit) async {
    emit(state.copyWith(status: CustomersStatus.loading));
    final r = await _getById(GetCustomerByIdParams(id: e.id));
    r.fold(
      (f) => emit(state.copyWith(status: CustomersStatus.error, message: f.message)),
      (c) => emit(state.copyWith(status: CustomersStatus.loaded, selectedCustomer: c)),
    );
  }

  Future<void> _onDelete(CustomersDeleteEvent e, Emitter<CustomersState> emit) async {
    emit(state.copyWith(status: CustomersStatus.loading));
    final r = await _delete(DeleteCustomerParams(id: e.id));
    r.fold(
      (f) => emit(state.copyWith(status: CustomersStatus.error, message: f.message)),
      (_) {
        emit(state.copyWith(status: CustomersStatus.deleted));
        add(const CustomersLoadEvent());
      },
    );
  }
}
