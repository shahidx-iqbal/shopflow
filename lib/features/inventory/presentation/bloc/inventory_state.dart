import 'package:equatable/equatable.dart';
import '../../../products/domain/entities/product_entity.dart';

enum InventoryStatus { initial, loading, loaded, success, error }

class InventoryState extends Equatable {
  const InventoryState({
    this.status = InventoryStatus.initial,
    this.items = const [],
    this.message,
  });
  final InventoryStatus status;
  final List<ProductEntity> items;
  final String? message;

  InventoryState copyWith({
    InventoryStatus? status,
    List<ProductEntity>? items,
    String? message,
  }) => InventoryState(
    status: status ?? this.status,
    items: items ?? this.items,
    message: message,
  );

  @override
  List<Object?> get props => [status, items, message];
}
