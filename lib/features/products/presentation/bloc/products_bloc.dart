import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/add_product_usecase.dart';
import '../../domain/usecases/check_barcode_exists_usecase.dart';
import '../../domain/usecases/deactivate_product_usecase.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/get_product_by_id_usecase.dart';
import '../../domain/usecases/get_product_sales_count_usecase.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/update_product_usecase.dart';
import 'products_event.dart';
import 'products_state.dart';

/// Manages product catalog listing, create, update, deactivate, and delete flows.
@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(
    this._getProducts,
    this._getById,
    this._addProduct,
    this._updateProduct,
    this._deleteProduct,
    this._deactivateProduct,
    this._checkBarcode,
    this._getSalesCount,
  ) : super(const ProductsState()) {
    on<ProductsLoadEvent>(_onLoad);
    on<ProductsAddEvent>(_onAdd);
    on<ProductsUpdateEvent>(_onUpdate);
    on<ProductsDeleteEvent>(_onDelete);
    on<ProductsDeactivateEvent>(_onDeactivate);
    on<ProductsLoadDetailsEvent>(_onDetails);
    on<ProductsClearPriceWarningEvent>(_onClearPriceWarning);
  }

  final GetProductsUseCase _getProducts;
  final GetProductByIdUseCase _getById;
  final AddProductUseCase _addProduct;
  final UpdateProductUseCase _updateProduct;
  final DeleteProductUseCase _deleteProduct;
  final DeactivateProductUseCase _deactivateProduct;
  final CheckBarcodeExistsUseCase _checkBarcode;
  final GetProductSalesCountUseCase _getSalesCount;

  Future<void> _onLoad(ProductsLoadEvent e, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: ProductsStatus.loading, clearMessage: true));
    final result = await _getProducts(GetProductsParams(query: e.query));
    result.fold(
      (f) => emit(
        state.copyWith(
          status: ProductsStatus.error,
          message: f.message,
          errorCode: f.code,
        ),
      ),
      (list) => emit(
        state.copyWith(
          status: ProductsStatus.loaded,
          products: list,
          priceBelowCostWarning: state.priceBelowCostWarning,
        ),
      ),
    );
  }

  Future<void> _onAdd(ProductsAddEvent e, Emitter<ProductsState> emit) async {
    emit(
      state.copyWith(
        status: ProductsStatus.loading,
        clearMessage: true,
        clearErrorCode: true,
      ),
    );

    final barcodeCheck = await _validateBarcode(e.product.barcode);
    if (barcodeCheck != null) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          message: barcodeCheck.message,
          errorCode: barcodeCheck.code,
        ),
      );
      return;
    }

    final priceWarning = e.product.price < e.product.costPrice;

    final result = await _addProduct(e.product);
    result.fold(
      (f) => emit(
        state.copyWith(
          status: ProductsStatus.error,
          message: f.message,
          errorCode: f.code,
        ),
      ),
      (_) {
        emit(
          state.copyWith(
            status: ProductsStatus.success,
            priceBelowCostWarning: priceWarning,
          ),
        );
        add(const ProductsLoadEvent());
      },
    );
  }

  Future<void> _onUpdate(
    ProductsUpdateEvent e,
    Emitter<ProductsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProductsStatus.loading,
        clearMessage: true,
        clearErrorCode: true,
      ),
    );

    final barcodeCheck = await _validateBarcode(
      e.product.barcode,
      excludeProductId: e.product.id,
    );
    if (barcodeCheck != null) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          message: barcodeCheck.message,
          errorCode: barcodeCheck.code,
        ),
      );
      return;
    }

    final priceWarning = e.product.price < e.product.costPrice;

    final result = await _updateProduct(e.product);
    result.fold(
      (f) => emit(
        state.copyWith(
          status: ProductsStatus.error,
          message: f.message,
          errorCode: f.code,
        ),
      ),
      (_) {
        emit(
          state.copyWith(
            status: ProductsStatus.success,
            priceBelowCostWarning: priceWarning,
          ),
        );
        add(const ProductsLoadEvent());
      },
    );
  }

  Future<void> _onDelete(
    ProductsDeleteEvent e,
    Emitter<ProductsState> emit,
  ) async {
    final salesResult =
        await _getSalesCount(GetProductSalesCountParams(productId: e.id));
    final salesCount = salesResult.fold((_) => 1, (count) => count);
    if (salesCount > 0) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          message: 'product_has_sales_history',
          errorCode: 'product_has_sales_history',
        ),
      );
      return;
    }

    emit(state.copyWith(status: ProductsStatus.loading));
    final result = await _deleteProduct(DeleteProductParams(id: e.id));
    result.fold(
      (f) => emit(
        state.copyWith(
          status: ProductsStatus.error,
          message: f.message,
          errorCode: f.code,
        ),
      ),
      (_) {
        emit(
          state.copyWith(
            status: ProductsStatus.deleted,
            selectedProduct: null,
          ),
        );
        add(const ProductsLoadEvent());
      },
    );
  }

  Future<void> _onDeactivate(
    ProductsDeactivateEvent e,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(status: ProductsStatus.loading));
    final result = await _deactivateProduct(DeactivateProductParams(id: e.id));
    result.fold(
      (f) => emit(
        state.copyWith(
          status: ProductsStatus.error,
          message: f.message,
          errorCode: f.code,
        ),
      ),
      (_) {
        emit(
          state.copyWith(
            status: ProductsStatus.deactivated,
            selectedProduct: state.selectedProduct?.copyWith(isActive: false),
          ),
        );
        add(ProductsLoadDetailsEvent(id: e.id));
      },
    );
  }

  Future<void> _onDetails(
    ProductsLoadDetailsEvent e,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(status: ProductsStatus.loading, clearMessage: true));
    final result = await _getById(GetProductByIdParams(id: e.id));
    await result.fold(
      (f) async => emit(
        state.copyWith(
          status: ProductsStatus.error,
          message: f.message,
          errorCode: f.code,
        ),
      ),
      (product) async {
        final salesResult = await _getSalesCount(
          GetProductSalesCountParams(productId: product.id),
        );
        final salesCount = salesResult.fold((_) => 0, (count) => count);
        emit(
          state.copyWith(
            status: ProductsStatus.loaded,
            selectedProduct: product,
            productSalesCount: salesCount,
          ),
        );
      },
    );
  }

  void _onClearPriceWarning(
    ProductsClearPriceWarningEvent event,
    Emitter<ProductsState> emit,
  ) {
    emit(state.copyWith(priceBelowCostWarning: false));
  }

  Future<Failure?> _validateBarcode(
    String barcode, {
    String? excludeProductId,
  }) async {
    if (barcode.trim().isEmpty) return null;
    final result = await _checkBarcode(
      CheckBarcodeExistsParams(
        barcode: barcode,
        excludeProductId: excludeProductId,
      ),
    );
    return result.fold(
      (failure) => failure,
      (exists) => exists
          ? const ValidationFailure(
              message: 'Barcode already exists on another product',
              code: 'barcode_exists',
            )
          : null,
    );
  }
}
