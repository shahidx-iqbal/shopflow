import 'package:equatable/equatable.dart';
import '../../domain/entities/customer_entity.dart';

enum CustomersStatus { initial, loading, loaded, success, deleted, error }

class CustomersState extends Equatable {
  const CustomersState({
    this.status = CustomersStatus.initial,
    this.customers = const [],
    this.selectedCustomer,
    this.message,
  });
  final CustomersStatus status;
  final List<CustomerEntity> customers;
  final CustomerEntity? selectedCustomer;
  final String? message;

  CustomersState copyWith({
    CustomersStatus? status,
    List<CustomerEntity>? customers,
    CustomerEntity? selectedCustomer,
    String? message,
  }) => CustomersState(
    status: status ?? this.status,
    customers: customers ?? this.customers,
    selectedCustomer: selectedCustomer ?? this.selectedCustomer,
    message: message,
  );

  @override
  List<Object?> get props => [status, customers, selectedCustomer, message];
}
