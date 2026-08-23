import 'package:equatable/equatable.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../../../pos/domain/entities/sale_enums.dart';

enum SalesHistoryStatus { initial, loading, loaded, error }

class SalesHistoryState extends Equatable {
  const SalesHistoryState({
    this.status = SalesHistoryStatus.initial,
    this.sales = const [],
    this.selectedSale,
    this.filter,
    this.message,
  });

  static const Object _unset = Object();

  final SalesHistoryStatus status;
  final List<SaleEntity> sales;
  final SaleEntity? selectedSale;
  final SaleType? filter;
  final String? message;

  SalesHistoryState copyWith({
    SalesHistoryStatus? status,
    List<SaleEntity>? sales,
    SaleEntity? selectedSale,
    Object? filter = _unset,
    String? message,
    bool clearMessage = false,
  }) =>
      SalesHistoryState(
        status: status ?? this.status,
        sales: sales ?? this.sales,
        selectedSale: selectedSale ?? this.selectedSale,
        filter: identical(filter, _unset) ? this.filter : filter as SaleType?,
        message: clearMessage ? null : (message ?? this.message),
      );

  @override
  List<Object?> get props => [status, sales, selectedSale, filter, message];
}
