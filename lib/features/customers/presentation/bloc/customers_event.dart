import 'package:equatable/equatable.dart';
import '../../domain/entities/customer_entity.dart';

abstract class CustomersEvent extends Equatable {
  const CustomersEvent();
  @override
  List<Object?> get props => [];
}

class CustomersLoadEvent extends CustomersEvent {
  const CustomersLoadEvent({this.query});
  final String? query;
  @override
  List<Object?> get props => [query];
}

class CustomersAddEvent extends CustomersEvent {
  const CustomersAddEvent({required this.customer});
  final CustomerEntity customer;
  @override
  List<Object?> get props => [customer];
}

class CustomersLoadDetailsEvent extends CustomersEvent {
  const CustomersLoadDetailsEvent({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}

class CustomersDeleteEvent extends CustomersEvent {
  const CustomersDeleteEvent({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}

class CustomersUpdateEvent extends CustomersEvent {
  const CustomersUpdateEvent({required this.customer});
  final CustomerEntity customer;
  @override
  List<Object?> get props => [customer];
}
