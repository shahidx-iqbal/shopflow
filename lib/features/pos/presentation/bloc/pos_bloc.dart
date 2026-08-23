import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/enums/customer_type.dart';
import '../../../../core/enums/unit_type.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/formatters.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../../products/domain/usecases/get_product_by_id_usecase.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/entities/sale_enums.dart';
import '../../domain/repositories/pos_repository.dart';
import '../../domain/services/pos_cart_calculator.dart';
import '../../domain/services/pos_cart_draft_mapper.dart';
import '../../domain/usecases/check_cart_stock_availability_usecase.dart';
import '../../domain/usecases/confirm_sale_usecase.dart';
import '../../domain/usecases/pos_get_product_by_barcode_usecase.dart';
import 'pos_event.dart';
import 'pos_state.dart';

/// Handles all POS checkout logic: cart management, sale type switching
/// (Cash Sale vs Ledger Sale), and confirming transactions.
/// Emits [PosState] variants consumed by [PosCheckoutPage].
@injectable
class PosBloc extends Bloc<PosEvent, PosState> {
  PosBloc(
    this._confirmSale,
    this._checkCartStock,
    this._getByBarcode,
    this._getProductById,
    this._posRepository,
  ) : super(const PosState()) {
    on<PosInitializeEvent>(_onInitialize);
    on<PosTapProductEvent>(_onTapProduct);
    on<PosAddProductWithQuantityEvent>(_onAddProductWithQuantity);
    on<PosDismissQuantitySheetEvent>(_onDismissQuantitySheet);
    on<PosAddToCartEvent>(_onAddToCart);
    on<PosRemoveFromCartEvent>(_onRemoveFromCart);
    on<PosUpdateQuantityEvent>(_onUpdateQuantity);
    on<PosApplyItemDiscountEvent>(_onApplyItemDiscount);
    on<PosApplyCartDiscountEvent>(_onApplyCartDiscount);
    on<PosSelectSaleTypeEvent>(_onSelectSaleType);
    on<PosSelectCustomerEvent>(_onSelectCustomer);
    on<PosClearCustomerEvent>(_onClearCustomer);
    on<PosTogglePartialPaymentEvent>(_onTogglePartial);
    on<PosUpdateCashReceivedEvent>(_onUpdateCash);
    on<PosConfirmSaleEvent>(_onConfirmSale);
    on<PosClearCartEvent>(_onClearCart);
    on<PosResumeDraftEvent>(_onResumeDraft);
    on<PosDiscardDraftEvent>(_onDiscardDraft);
    on<PosAcknowledgeSuccessEvent>(_onAcknowledgeSuccess);
    on<PosAcknowledgeErrorEvent>(_onAcknowledgeError);
    on<PosScanBarcodeEvent>(_onScanBarcode);
    on<PosAcknowledgeScanNotFoundEvent>(_onAcknowledgeScanNotFound);
    on<PosAcknowledgeOutOfStockEvent>(_onAcknowledgeOutOfStock);
  }

  final ConfirmSaleUseCase _confirmSale;
  final CheckCartStockAvailabilityUseCase _checkCartStock;
  final PosGetProductByBarcodeUseCase _getByBarcode;
  final GetProductByIdUseCase _getProductById;
  final PosRepository _posRepository;

  Future<void> _onInitialize(
    PosInitializeEvent event,
    Emitter<PosState> emit,
  ) async {
    emit(
      state.copyWith(
        taxEnabled: event.taxEnabled,
        taxRate: event.taxRate,
        status: PosStatus.loading,
      ),
    );

    final draftResult = await _posRepository.loadCartDraft();
    draftResult.fold(
      (_) => emit(
        state.copyWith(
          status: PosStatus.ready,
          taxEnabled: event.taxEnabled,
          taxRate: event.taxRate,
        ),
      ),
      (draft) {
        if (PosCartDraftMapper.isNonEmpty(draft)) {
          emit(
            state.copyWith(
              status: PosStatus.ready,
              taxEnabled: event.taxEnabled,
              taxRate: event.taxRate,
              showResumeDraftPrompt: true,
              pendingDraft: draft,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: PosStatus.ready,
              taxEnabled: event.taxEnabled,
              taxRate: event.taxRate,
            ),
          );
        }
      },
    );
  }

  void _onTapProduct(PosTapProductEvent event, Emitter<PosState> emit) {
    _handleProductSelection(event.product, emit, source: _ProductAddSource.tap);
  }

  void _onAddToCart(PosAddToCartEvent event, Emitter<PosState> emit) {
    _handleProductSelection(
      event.product,
      emit,
      source: _ProductAddSource.tap,
    );
  }

  void _handleProductSelection(
    ProductEntity product,
    Emitter<PosState> emit, {
    required _ProductAddSource source,
  }) {
    if (!_isSellable(product)) {
      emit(
        state.copyWith(
          status: PosStatus.ready,
          warningMessage: 'out_of_stock',
          clearPendingQuantityProduct: true,
        ),
      );
      return;
    }

    final unit = UnitType.fromString(product.unit);
    if (unit.allowsDecimalQuantity) {
      final existing = _findCartItem(product.id);
      emit(
        state.copyWith(
          status: PosStatus.ready,
          pendingQuantityProduct: product,
          pendingQuantityPrefill: existing?.quantity,
          clearWarningMessage: true,
          clearScannedBarcodeNotFound: true,
          clearOutOfStockProduct: true,
        ),
      );
      return;
    }

    _addPieceProduct(product, emit, increment: source != _ProductAddSource.legacy);
  }

  void _onAddProductWithQuantity(
    PosAddProductWithQuantityEvent event,
    Emitter<PosState> emit,
  ) {
    final product = event.product;
    if (!_isSellable(product)) {
      emit(
        state.copyWith(
          status: PosStatus.ready,
          warningMessage: 'out_of_stock',
          clearPendingQuantityProduct: true,
        ),
      );
      return;
    }

    final unit = UnitType.fromString(product.unit);
    var quantity = event.quantity;

    if (event.mode == PosQuantityInputMode.byAmount &&
        event.amount != null &&
        event.amount! > 0) {
      quantity = PosCartCalculator.quantityFromAmount(
        amount: event.amount!,
        pricePerUnit: product.price,
      );
    }

    quantity = PosCartCalculator.normalizeQuantity(unit: unit, quantity: quantity);
    if (quantity <= 0) {
      emit(
        state.copyWith(
          status: PosStatus.ready,
          warningMessage: 'invalid_quantity',
          clearPendingQuantityProduct: true,
        ),
      );
      return;
    }

    final stockResult = _resolveQuantityAgainstStock(
      product: product,
      desiredQuantity: quantity,
      replaceExisting: true,
    );

    if (stockResult.blocked) {
      emit(
        state.copyWith(
          status: PosStatus.ready,
          warningMessage: stockResult.warning ?? 'out_of_stock',
          clearPendingQuantityProduct: true,
        ),
      );
      return;
    }

    final items = _upsertCartItem(
      product: product,
      quantity: stockResult.quantity,
      replace: true,
    );

    _emitCartMutation(
      emit,
      state.copyWith(
        cartItems: items,
        status: PosStatus.ready,
        clearPendingQuantityProduct: true,
        clearPendingQuantityPrefill: true,
        warningMessage: stockResult.warning,
        clearScannedBarcodeNotFound: true,
      ),
    );
  }

  void _onDismissQuantitySheet(
    PosDismissQuantitySheetEvent event,
    Emitter<PosState> emit,
  ) {
    emit(
      state.copyWith(
        clearPendingQuantityProduct: true,
        clearPendingQuantityPrefill: true,
      ),
    );
  }

  void _addPieceProduct(
    ProductEntity product,
    Emitter<PosState> emit, {
    required bool increment,
  }) {
    final existing = _findCartItem(product.id);
    final desired = increment && existing != null
        ? existing.quantity + 1
        : 1.0;

    final stockResult = _resolveQuantityAgainstStock(
      product: product,
      desiredQuantity: desired,
      replaceExisting: !increment || existing == null,
    );

    if (stockResult.blocked) {
      emit(
        state.copyWith(
          status: PosStatus.ready,
          warningMessage: stockResult.warning ?? 'out_of_stock',
        ),
      );
      return;
    }

    final items = _upsertCartItem(
      product: product,
      quantity: stockResult.quantity,
      replace: !increment || existing == null,
    );

    _emitCartMutation(
      emit,
      state.copyWith(
        cartItems: items,
        status: PosStatus.ready,
        warningMessage: stockResult.warning,
        clearScannedBarcodeNotFound: true,
      ),
    );
  }

  void _onRemoveFromCart(PosRemoveFromCartEvent event, Emitter<PosState> emit) {
    final items = state.cartItems
        .where((e) => e.productId != event.productId)
        .toList();
    _emitCartMutation(
      emit,
      state.copyWith(
        cartItems: items,
        status: PosStatus.ready,
        clearWarningMessage: true,
      ),
    );
  }

  Future<void> _onUpdateQuantity(
    PosUpdateQuantityEvent event,
    Emitter<PosState> emit,
  ) async {
    if (event.quantity <= 0) {
      add(PosRemoveFromCartEvent(productId: event.productId));
      return;
    }

    final product = event.product ??
        await _fetchProduct(event.productId);

    if (product == null) {
      emit(
        state.copyWith(
          status: PosStatus.error,
          message: 'product_not_found',
        ),
      );
      return;
    }

    final unit = UnitType.fromString(product.unit);
    final normalized = PosCartCalculator.normalizeQuantity(
      unit: unit,
      quantity: event.quantity,
    );

    final stockResult = _resolveQuantityAgainstStock(
      product: product,
      desiredQuantity: normalized,
      replaceExisting: true,
    );

    if (stockResult.blocked) {
      emit(
        state.copyWith(
          status: PosStatus.ready,
          warningMessage: stockResult.warning ?? 'out_of_stock',
        ),
      );
      return;
    }

    final items = state.cartItems.map((item) {
      if (item.productId != event.productId) return item;
      return PosCartCalculator.fromProduct(
        product: product,
        quantity: stockResult.quantity,
        discount: item.discount,
      ).copyWith(note: item.note);
    }).toList();

    _emitCartMutation(
      emit,
      state.copyWith(
        cartItems: items,
        status: PosStatus.ready,
        warningMessage: stockResult.warning,
      ),
    );
  }

  void _onApplyItemDiscount(
    PosApplyItemDiscountEvent event,
    Emitter<PosState> emit,
  ) {
    final items = state.cartItems.map((item) {
      if (item.productId != event.productId) return item;
      return item.copyWith(
        discount: PosCartCalculator.clampItemDiscount(item, event.discount),
      );
    }).toList();

    _emitCartMutation(
      emit,
      state.copyWith(
        cartItems: items,
        status: PosStatus.ready,
        cartDiscount: PosCartCalculator.clampCartDiscount(
          PosCartCalculator.itemsSubtotal(items),
          state.cartDiscount,
        ),
      ),
    );
  }

  void _onApplyCartDiscount(
    PosApplyCartDiscountEvent event,
    Emitter<PosState> emit,
  ) {
    _emitCartMutation(
      emit,
      state.copyWith(
        cartDiscount: PosCartCalculator.clampCartDiscount(
          state.itemsSubtotal,
          event.discount,
        ),
        status: PosStatus.ready,
      ),
    );
  }

  void _onSelectSaleType(PosSelectSaleTypeEvent event, Emitter<PosState> emit) {
    if (event.saleType == SaleType.ledger && state.isLedgerSaleLocked) {
      return;
    }

    var next = state.copyWith(
      saleType: event.saleType,
      status: PosStatus.ready,
    );

    if (event.saleType == SaleType.cash) {
      next = next.copyWith(
        isPartialPayment: false,
        cashReceived: 0,
      );
    }

    _emitCartMutation(emit, next);
  }

  void _onSelectCustomer(PosSelectCustomerEvent event, Emitter<PosState> emit) {
    final customer = event.customer;
    final forceCash = customer.customerType == CustomerType.cash;

    _emitCartMutation(
      emit,
      state.copyWith(
        selectedCustomer: customer,
        saleType: forceCash ? SaleType.cash : state.saleType,
        isPartialPayment: forceCash ? false : state.isPartialPayment,
        cashReceived: forceCash ? 0 : state.cashReceived,
        status: PosStatus.ready,
      ),
    );
  }

  void _onClearCustomer(PosClearCustomerEvent event, Emitter<PosState> emit) {
    _emitCartMutation(
      emit,
      state.copyWith(
        clearCustomer: true,
        saleType: SaleType.cash,
        isPartialPayment: false,
        cashReceived: 0,
        status: PosStatus.ready,
      ),
    );
  }

  void _onTogglePartial(
    PosTogglePartialPaymentEvent event,
    Emitter<PosState> emit,
  ) {
    if (state.saleType != SaleType.ledger) return;

    final enabled = event.enabled;
    _emitCartMutation(
      emit,
      state.copyWith(
        isPartialPayment: enabled,
        cashReceived: enabled ? state.cashReceived : 0,
        status: PosStatus.ready,
      ),
    );
  }

  void _onUpdateCash(PosUpdateCashReceivedEvent event, Emitter<PosState> emit) {
    var amount = event.amount;
    if (amount < 0) amount = 0;

    if (state.saleType == SaleType.ledger && state.isPartialPayment) {
      amount = amount.clamp(0, state.total);
    }

    _emitCartMutation(
      emit,
      state.copyWith(
        cashReceived: amount,
        status: PosStatus.ready,
      ),
    );
  }

  Future<void> _onConfirmSale(
    PosConfirmSaleEvent event,
    Emitter<PosState> emit,
  ) async {
    var working = state;
    if (event.cashReceived != null) {
      working = state.copyWith(cashReceived: event.cashReceived!);
      emit(working);
    }

    if (working.cartItems.isEmpty) {
      emit(working.copyWith(status: PosStatus.error, message: 'cart_empty'));
      return;
    }

    if (working.saleType == SaleType.ledger &&
        working.selectedCustomer == null) {
      emit(
        working.copyWith(
          status: PosStatus.error,
          message: 'customer_required',
        ),
      );
      return;
    }

    if (working.saleType == SaleType.cash && working.cashReceived <= 0) {
      emit(
        working.copyWith(
          status: PosStatus.error,
          message: 'cash_required',
        ),
      );
      return;
    }

    final roundedCash = Formatters.roundCurrency(working.cashReceived);
    final roundedTotal = Formatters.roundCurrency(working.total);
    if (working.saleType == SaleType.cash &&
        roundedCash > 0 &&
        roundedCash < roundedTotal) {
      emit(
        working.copyWith(
          status: PosStatus.error,
          message: 'insufficient_cash',
        ),
      );
      return;
    }

    final paymentStatus = _resolvePaymentStatusFor(working);

    emit(
      working.copyWith(
        status: PosStatus.submitting,
        clearMessage: true,
        clearErrorDetail: true,
      ),
    );

    final stockCheck = await _checkCartStock(
      CheckCartStockParams(items: working.cartItems),
    );

    final stockFailure = stockCheck.fold<Failure?>((f) => f, (_) => null);
    if (stockFailure != null) {
      emit(
        working.copyWith(
          status: PosStatus.error,
          message: stockFailure.code ?? 'insufficient_stock',
          errorDetail: stockFailure.message,
        ),
      );
      return;
    }

    final sale = SaleEntity(
      items: working.cartItems,
      saleType: working.saleType,
      customer: working.selectedCustomer,
      paymentStatus: paymentStatus,
      status: SaleStatus.completed,
      subtotal: working.itemsSubtotal,
      discount: working.cartDiscount,
      tax: working.tax,
      cashReceived: _cashReceivedForSale(working),
      amountPaidNow: _amountPaidNowFor(working),
      addedToLedger: _ledgerRemainderFor(working),
      total: working.total,
      createdAt: DateTime.now(),
    );

    final result = await _confirmSale(sale);
    result.fold(
      (failure) => emit(
        working.copyWith(
          status: PosStatus.error,
          message: failure.code ?? 'confirm_failed',
          errorDetail: failure.message,
        ),
      ),
      (savedSale) => emit(
        PosState(
          status: PosStatus.success,
          lastCompletedSale: savedSale,
          taxEnabled: working.taxEnabled,
          taxRate: working.taxRate,
        ),
      ),
    );
  }

  Future<void> _onClearCart(PosClearCartEvent event, Emitter<PosState> emit) async {
    await _posRepository.clearCartDraft();
    emit(
      PosState(
        status: PosStatus.ready,
        taxEnabled: state.taxEnabled,
        taxRate: state.taxRate,
      ),
    );
  }

  void _onResumeDraft(PosResumeDraftEvent event, Emitter<PosState> emit) {
    final draft = state.pendingDraft;
    if (draft == null) return;

    final restored = PosCartDraftMapper.fromModel(draft).copyWith(
      showResumeDraftPrompt: false,
      clearPendingDraft: true,
      taxEnabled: state.taxEnabled,
      taxRate: state.taxRate,
    );
    emit(restored);
    unawaited(_persistDraft(restored));
  }

  Future<void> _onDiscardDraft(
    PosDiscardDraftEvent event,
    Emitter<PosState> emit,
  ) async {
    await _posRepository.clearCartDraft();
    emit(
      state.copyWith(
        showResumeDraftPrompt: false,
        clearPendingDraft: true,
      ),
    );
  }

  void _onAcknowledgeSuccess(
    PosAcknowledgeSuccessEvent event,
    Emitter<PosState> emit,
  ) {
    emit(
      PosState(
        status: PosStatus.ready,
        taxEnabled: state.taxEnabled,
        taxRate: state.taxRate,
      ),
    );
  }

  void _onAcknowledgeError(
    PosAcknowledgeErrorEvent event,
    Emitter<PosState> emit,
  ) {
    emit(
      state.copyWith(
        status: PosStatus.ready,
        clearMessage: true,
        clearErrorDetail: true,
      ),
    );
  }

  Future<void> _onScanBarcode(
    PosScanBarcodeEvent event,
    Emitter<PosState> emit,
  ) async {
    emit(
      state.copyWith(
        status: PosStatus.loading,
        clearScannedBarcodeNotFound: true,
        clearOutOfStockProduct: true,
        clearWarningMessage: true,
      ),
    );

    final result = await _getByBarcode(PosBarcodeParams(barcode: event.barcode));
    result.fold(
      (failure) {
        if (failure.code == 'product_not_found') {
          emit(
            state.copyWith(
              status: PosStatus.ready,
              scannedBarcodeNotFound: event.barcode,
              clearOutOfStockProduct: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: PosStatus.error,
              message: failure.code ?? failure.message,
            ),
          );
        }
      },
      (product) {
        if (!_isSellable(product)) {
          emit(
            state.copyWith(
              status: PosStatus.ready,
              outOfStockProduct: product,
              clearScannedBarcodeNotFound: true,
              clearWarningMessage: true,
            ),
          );
          return;
        }

        final unit = UnitType.fromString(product.unit);
        if (unit.allowsDecimalQuantity) {
          final existing = _findCartItem(product.id);
          emit(
            state.copyWith(
              status: PosStatus.ready,
              pendingQuantityProduct: product,
              pendingQuantityPrefill: existing?.quantity,
              clearScannedBarcodeNotFound: true,
              clearOutOfStockProduct: true,
            ),
          );
        } else {
          _addPieceProduct(product, emit, increment: true);
        }
      },
    );
  }

  void _onAcknowledgeScanNotFound(
    PosAcknowledgeScanNotFoundEvent event,
    Emitter<PosState> emit,
  ) {
    emit(state.copyWith(clearScannedBarcodeNotFound: true));
  }

  void _onAcknowledgeOutOfStock(
    PosAcknowledgeOutOfStockEvent event,
    Emitter<PosState> emit,
  ) {
    emit(state.copyWith(clearOutOfStockProduct: true));
  }

  void _emitCartMutation(Emitter<PosState> emit, PosState next) {
    emit(next);
    if (!next.showResumeDraftPrompt) {
      unawaited(_persistDraft(next));
    }
  }

  Future<void> _persistDraft(PosState snapshot) async {
    if (snapshot.cartItems.isEmpty &&
        snapshot.selectedCustomer == null &&
        snapshot.saleType == SaleType.cash &&
        !snapshot.isPartialPayment &&
        snapshot.cashReceived == 0 &&
        snapshot.cartDiscount == 0) {
      await _posRepository.clearCartDraft();
      return;
    }

    await _posRepository.saveCartDraft(PosCartDraftMapper.toModel(snapshot));
  }

  PaymentStatus _resolvePaymentStatusFor(PosState snapshot) {
    if (snapshot.saleType == SaleType.cash) {
      return PaymentStatus.paid;
    }
    if (!snapshot.isPartialPayment || snapshot.cashReceived <= 0) {
      return PaymentStatus.unpaid;
    }
    if (snapshot.cashReceived >= snapshot.total) {
      return PaymentStatus.paid;
    }
    return PaymentStatus.partiallyPaid;
  }

  double? _cashReceivedForSale(PosState snapshot) {
    if (snapshot.saleType == SaleType.cash) {
      return snapshot.cashReceived;
    }
    if (snapshot.isPartialPayment && snapshot.cashReceived > 0) {
      return snapshot.cashReceived;
    }
    return null;
  }

  double _amountPaidNowFor(PosState snapshot) {
    if (snapshot.saleType == SaleType.cash) {
      return Formatters.roundCurrency(snapshot.cashReceived);
    }
    if (!snapshot.isPartialPayment) return 0;
    return Formatters.roundCurrency(
      snapshot.cashReceived.clamp(0, snapshot.total),
    );
  }

  double _ledgerRemainderFor(PosState snapshot) {
    if (snapshot.saleType != SaleType.ledger) return 0;
    if (!snapshot.isPartialPayment) return snapshot.total;
    return Formatters.roundCurrency(
      (snapshot.total - _amountPaidNowFor(snapshot)).clamp(0, snapshot.total),
    );
  }

  bool _isSellable(ProductEntity product) =>
      product.isActive && product.stock > 0;

  CartItemEntity? _findCartItem(String productId) {
    for (final item in state.cartItems) {
      if (item.productId == productId) return item;
    }
    return null;
  }

  double _cartQuantityForProduct(String productId) =>
      _findCartItem(productId)?.quantity ?? 0;

  _StockResolution _resolveQuantityAgainstStock({
    required ProductEntity product,
    required double desiredQuantity,
    required bool replaceExisting,
  }) {
    final available = PosCartCalculator.availableStock(product);
    if (available <= 0) {
      return const _StockResolution.blocked('out_of_stock');
    }

    final currentInCart =
        replaceExisting ? 0 : _cartQuantityForProduct(product.id);
    final maxAllowed = available - currentInCart;

    if (maxAllowed <= 0) {
      return const _StockResolution.blocked('stock_exceeded');
    }

    if (desiredQuantity <= maxAllowed) {
      return _StockResolution.ok(desiredQuantity);
    }

    return _StockResolution.capped(
      maxAllowed,
      warning: 'stock_capped',
    );
  }

  List<CartItemEntity> _upsertCartItem({
    required ProductEntity product,
    required double quantity,
    required bool replace,
  }) {
    final items = List<CartItemEntity>.from(state.cartItems);
    final index = items.indexWhere((e) => e.productId == product.id);
    final nextItem = PosCartCalculator.fromProduct(
      product: product,
      quantity: quantity,
      discount: index >= 0 ? items[index].discount : 0,
    ).copyWith(note: index >= 0 ? items[index].note : null);

    if (index >= 0) {
      items[index] = nextItem;
    } else {
      items.add(nextItem);
    }
    return items;
  }

  Future<ProductEntity?> _fetchProduct(String id) async {
    final result = await _getProductById(GetProductByIdParams(id: id));
    return result.fold((_) => null, (product) => product);
  }
}

enum _ProductAddSource { tap, legacy }

class _StockResolution {
  const _StockResolution.ok(this.quantity)
      : blocked = false,
        warning = null;

  const _StockResolution.blocked(this.warning)
      : quantity = 0,
        blocked = true;

  const _StockResolution.capped(this.quantity, {required this.warning})
      : blocked = false;

  final double quantity;
  final bool blocked;
  final String? warning;
}
