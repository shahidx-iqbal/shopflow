import 'package:equatable/equatable.dart';

import '../../../../core/utils/formatters.dart';

/// A single cart line that exceeds available stock at confirm time.
class CartStockIssue extends Equatable {
  const CartStockIssue({
    required this.productId,
    required this.productName,
    required this.requested,
    required this.available,
    required this.unit,
  });

  final String productId;
  final String productName;
  final double requested;
  final double available;
  final String unit;

  String get message {
    final avail = Formatters.roundQuantity(available);
    final unitLabel = unit.trim().isEmpty ? '' : ' $unit';
    return '$productName only has $avail$unitLabel left';
  }

  @override
  List<Object?> get props =>
      [productId, productName, requested, available, unit];
}

/// Thrown as a [ValidationFailure] when confirm-time stock check fails.
class InsufficientStockFailure extends Equatable {
  const InsufficientStockFailure(this.issues);

  final List<CartStockIssue> issues;

  String get message =>
      issues.isNotEmpty ? issues.first.message : 'Insufficient stock';

  String get code => 'insufficient_stock';

  @override
  List<Object?> get props => [issues];
}
