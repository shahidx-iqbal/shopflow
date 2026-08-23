import 'package:equatable/equatable.dart';

import '../../../../core/enums/customer_type.dart';
import '../../../../core/utils/formatters.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../data/models/pos_cart_draft_model.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/entities/sale_enums.dart';
import '../../domain/services/pos_cart_calculator.dart';

enum PosStatus { initial, loading, ready, submitting, success, error }

class PosState extends Equatable {
  const PosState({
    this.status = PosStatus.initial,
    this.cartItems = const [],
    this.saleType = SaleType.cash,
    this.selectedCustomer,
    this.isPartialPayment = false,
    this.cashReceived = 0,
    this.cartDiscount = 0,
    this.taxEnabled = false,
    this.taxRate = 0,
    this.pendingQuantityProduct,
    this.pendingQuantityPrefill,
    this.scannedBarcodeNotFound,
    this.outOfStockProduct,
    this.showResumeDraftPrompt = false,
    this.pendingDraft,
    this.message,
    this.errorDetail,
    this.warningMessage,
    this.lastCompletedSale,
  });

  final PosStatus status;
  final List<CartItemEntity> cartItems;
  final SaleType saleType;
  final CustomerEntity? selectedCustomer;
  final bool isPartialPayment;
  final double cashReceived;
  final double cartDiscount;
  final bool taxEnabled;
  final double taxRate;
  final ProductEntity? pendingQuantityProduct;
  final double? pendingQuantityPrefill;
  final String? scannedBarcodeNotFound;
  /// Product matched by barcode scan but cannot be sold (stock <= 0 or inactive).
  final ProductEntity? outOfStockProduct;
  final bool showResumeDraftPrompt;
  final PosCartDraftModel? pendingDraft;
  final String? message;
  final String? errorDetail;
  final String? warningMessage;
  final SaleEntity? lastCompletedSale;

  bool get isLedgerSaleLocked =>
      selectedCustomer?.customerType == CustomerType.cash;

  bool get canConfirmSale =>
      cartItems.isNotEmpty && status != PosStatus.submitting;

  double get itemsSubtotal => PosCartCalculator.itemsSubtotal(cartItems);

  double get taxableSubtotal =>
      PosCartCalculator.taxableSubtotal(itemsSubtotal, cartDiscount);

  double get tax => PosCartCalculator.taxAmount(
        taxableSubtotal: taxableSubtotal,
        taxRate: taxRate,
        taxEnabled: taxEnabled,
      );

  double get total => PosCartCalculator.grandTotal(
        items: cartItems,
        cartDiscount: cartDiscount,
        taxRate: taxRate,
        taxEnabled: taxEnabled,
      );

  double get changeDue {
    if (saleType != SaleType.cash) return 0;
    return Formatters.roundCurrency(
      (cashReceived - total).clamp(0, double.infinity),
    );
  }

  double get amountPaidNow {
    if (saleType == SaleType.cash) {
      return cashReceived > 0 ? Formatters.roundCurrency(cashReceived) : total;
    }
    if (!isPartialPayment) return 0;
    return Formatters.roundCurrency(cashReceived.clamp(0, total));
  }

  double get ledgerRemainder {
    if (saleType != SaleType.ledger) return 0;
    if (!isPartialPayment) return total;
    return Formatters.roundCurrency((total - amountPaidNow).clamp(0, total));
  }

  double get outstandingBalanceBeforeSale =>
      selectedCustomer?.balance ?? 0;

  PosState copyWith({
    PosStatus? status,
    List<CartItemEntity>? cartItems,
    SaleType? saleType,
    CustomerEntity? selectedCustomer,
    bool clearCustomer = false,
    bool? isPartialPayment,
    double? cashReceived,
    double? cartDiscount,
    bool? taxEnabled,
    double? taxRate,
    ProductEntity? pendingQuantityProduct,
    bool clearPendingQuantityProduct = false,
    double? pendingQuantityPrefill,
    bool clearPendingQuantityPrefill = false,
    String? scannedBarcodeNotFound,
    bool clearScannedBarcodeNotFound = false,
    ProductEntity? outOfStockProduct,
    bool clearOutOfStockProduct = false,
    bool? showResumeDraftPrompt,
    PosCartDraftModel? pendingDraft,
    bool clearPendingDraft = false,
    String? message,
    bool clearMessage = false,
    String? errorDetail,
    bool clearErrorDetail = false,
    String? warningMessage,
    bool clearWarningMessage = false,
    SaleEntity? lastCompletedSale,
    bool clearLastCompletedSale = false,
  }) {
    return PosState(
      status: status ?? this.status,
      cartItems: cartItems ?? this.cartItems,
      saleType: saleType ?? this.saleType,
      selectedCustomer:
          clearCustomer ? null : (selectedCustomer ?? this.selectedCustomer),
      isPartialPayment: isPartialPayment ?? this.isPartialPayment,
      cashReceived: cashReceived ?? this.cashReceived,
      cartDiscount: cartDiscount ?? this.cartDiscount,
      taxEnabled: taxEnabled ?? this.taxEnabled,
      taxRate: taxRate ?? this.taxRate,
      pendingQuantityProduct: clearPendingQuantityProduct
          ? null
          : (pendingQuantityProduct ?? this.pendingQuantityProduct),
      pendingQuantityPrefill: clearPendingQuantityPrefill
          ? null
          : (pendingQuantityPrefill ?? this.pendingQuantityPrefill),
      scannedBarcodeNotFound: clearScannedBarcodeNotFound
          ? null
          : (scannedBarcodeNotFound ?? this.scannedBarcodeNotFound),
      outOfStockProduct: clearOutOfStockProduct
          ? null
          : (outOfStockProduct ?? this.outOfStockProduct),
      showResumeDraftPrompt:
          showResumeDraftPrompt ?? this.showResumeDraftPrompt,
      pendingDraft:
          clearPendingDraft ? null : (pendingDraft ?? this.pendingDraft),
      message: clearMessage ? null : (message ?? this.message),
      errorDetail:
          clearErrorDetail ? null : (errorDetail ?? this.errorDetail),
      warningMessage:
          clearWarningMessage ? null : (warningMessage ?? this.warningMessage),
      lastCompletedSale: clearLastCompletedSale
          ? null
          : (lastCompletedSale ?? this.lastCompletedSale),
    );
  }

  @override
  List<Object?> get props => [
        status,
        cartItems,
        saleType,
        selectedCustomer,
        isPartialPayment,
        cashReceived,
        cartDiscount,
        taxEnabled,
        taxRate,
        pendingQuantityProduct,
        pendingQuantityPrefill,
        scannedBarcodeNotFound,
        outOfStockProduct,
        showResumeDraftPrompt,
        pendingDraft,
        message,
        errorDetail,
        warningMessage,
        lastCompletedSale,
      ];
}
