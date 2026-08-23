import 'package:equatable/equatable.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();
  @override
  List<Object?> get props => [];
}

class InventoryLoadEvent extends InventoryEvent {
  const InventoryLoadEvent({this.lowStockOnly = false});
  final bool lowStockOnly;
  @override
  List<Object?> get props => [lowStockOnly];
}

class InventoryAdjustEvent extends InventoryEvent {
  const InventoryAdjustEvent({
    required this.productId,
    required this.newStock,
    required this.reason,
  });
  final String productId;
  final int newStock;
  final String reason;
  @override
  List<Object?> get props => [productId, newStock, reason];
}
