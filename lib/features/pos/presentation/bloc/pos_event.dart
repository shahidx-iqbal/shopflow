import 'package:equatable/equatable.dart';

import '../../../customers/domain/entities/customer_entity.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../domain/entities/sale_enums.dart';

/// How weighted-product quantity was entered in the quantity sheet.
enum PosQuantityInputMode { byWeight, byAmount }

abstract class PosEvent extends Equatable {
  const PosEvent();

  @override
  List<Object?> get props => [];
}

/// Loads tax settings for totals (optional — defaults to disabled).
class PosInitializeEvent extends PosEvent {
  const PosInitializeEvent({
    this.taxEnabled = false,
    this.taxRate = 0,
  });

  final bool taxEnabled;
  final double taxRate;

  @override
  List<Object?> get props => [taxEnabled, taxRate];
}

/// Product tapped from POS grid — piece items merge +1; weight items open sheet.
class PosTapProductEvent extends PosEvent {
  const PosTapProductEvent({required this.product});

  final ProductEntity product;

  @override
  List<Object?> get props => [product];
}

/// Adds or replaces quantity after quantity sheet (weight / amount modes).
class PosAddProductWithQuantityEvent extends PosEvent {
  const PosAddProductWithQuantityEvent({
    required this.product,
    required this.quantity,
    this.mode,
    this.amount,
  });

  final ProductEntity product;
  final double quantity;
  final PosQuantityInputMode? mode;
  final double? amount;

  @override
  List<Object?> get props => [product, quantity, mode, amount];
}

/// Cancels the open quantity sheet without changing the cart.
class PosDismissQuantitySheetEvent extends PosEvent {
  const PosDismissQuantitySheetEvent();
}

class PosRemoveFromCartEvent extends PosEvent {
  const PosRemoveFromCartEvent({required this.productId});

  final String productId;

  @override
  List<Object?> get props => [productId];
}

class PosUpdateQuantityEvent extends PosEvent {
  const PosUpdateQuantityEvent({
    required this.productId,
    required this.quantity,
    this.product,
  });

  final String productId;
  final double quantity;
  /// When omitted the bloc fetches live stock by [productId].
  final ProductEntity? product;

  @override
  List<Object?> get props => [productId, quantity, product];
}

class PosApplyItemDiscountEvent extends PosEvent {
  const PosApplyItemDiscountEvent({
    required this.productId,
    required this.discount,
  });

  final String productId;
  final double discount;

  @override
  List<Object?> get props => [productId, discount];
}

class PosApplyCartDiscountEvent extends PosEvent {
  const PosApplyCartDiscountEvent({required this.discount});

  final double discount;

  @override
  List<Object?> get props => [discount];
}

class PosSelectSaleTypeEvent extends PosEvent {
  const PosSelectSaleTypeEvent({required this.saleType});

  final SaleType saleType;

  @override
  List<Object?> get props => [saleType];
}

class PosSelectCustomerEvent extends PosEvent {
  const PosSelectCustomerEvent({required this.customer});

  final CustomerEntity customer;

  @override
  List<Object?> get props => [customer];
}

class PosClearCustomerEvent extends PosEvent {
  const PosClearCustomerEvent();
}

class PosTogglePartialPaymentEvent extends PosEvent {
  const PosTogglePartialPaymentEvent({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

class PosUpdateCashReceivedEvent extends PosEvent {
  const PosUpdateCashReceivedEvent({required this.amount});

  final double amount;

  @override
  List<Object?> get props => [amount];
}

class PosConfirmSaleEvent extends PosEvent {
  const PosConfirmSaleEvent({this.cashReceived});

  /// Latest cash field value from the UI — applied atomically at confirm time.
  final double? cashReceived;

  @override
  List<Object?> get props => [cashReceived];
}

class PosClearCartEvent extends PosEvent {
  const PosClearCartEvent();
}

/// Restores a persisted cart draft after user confirms resume prompt.
class PosResumeDraftEvent extends PosEvent {
  const PosResumeDraftEvent();
}

/// Discards a persisted cart draft after user declines resume prompt.
class PosDiscardDraftEvent extends PosEvent {
  const PosDiscardDraftEvent();
}

/// Clears payment success state after the success dialog is dismissed.
class PosAcknowledgeSuccessEvent extends PosEvent {
  const PosAcknowledgeSuccessEvent();
}

/// Clears a displayed validation/error dialog state.
class PosAcknowledgeErrorEvent extends PosEvent {
  const PosAcknowledgeErrorEvent();
}

class PosScanBarcodeEvent extends PosEvent {
  const PosScanBarcodeEvent({required this.barcode});

  final String barcode;

  @override
  List<Object?> get props => [barcode];
}

/// UI acknowledged barcode-not-found dialog — clears pending scan state.
class PosAcknowledgeScanNotFoundEvent extends PosEvent {
  const PosAcknowledgeScanNotFoundEvent();
}

/// UI acknowledged scanned-product-out-of-stock inline message.
class PosAcknowledgeOutOfStockEvent extends PosEvent {
  const PosAcknowledgeOutOfStockEvent();
}

/// Adds product to cart from POS product card or detail screen.
class PosAddToCartEvent extends PosEvent {
  const PosAddToCartEvent({required this.product});

  final ProductEntity product;

  @override
  List<Object?> get props => [product];
}
