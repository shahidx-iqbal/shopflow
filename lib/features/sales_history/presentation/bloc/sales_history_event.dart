import 'package:equatable/equatable.dart';
import '../../../pos/domain/entities/sale_enums.dart';

abstract class SalesHistoryEvent extends Equatable {
  const SalesHistoryEvent();
  @override
  List<Object?> get props => [];
}

class SalesHistoryLoadEvent extends SalesHistoryEvent {
  const SalesHistoryLoadEvent({this.filter});
  final SaleType? filter;
  @override
  List<Object?> get props => [filter];
}

class SalesHistoryLoadDetailsEvent extends SalesHistoryEvent {
  const SalesHistoryLoadDetailsEvent({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}
