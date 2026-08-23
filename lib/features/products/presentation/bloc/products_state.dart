import 'package:equatable/equatable.dart';
import '../../domain/entities/product_entity.dart';

enum ProductsStatus {
  initial,
  loading,
  loaded,
  success,
  deleted,
  deactivated,
  error,
}

class ProductsState extends Equatable {
  const ProductsState({
    this.status = ProductsStatus.initial,
    this.products = const [],
    this.selectedProduct,
    this.productSalesCount,
    this.priceBelowCostWarning = false,
    this.message,
    this.errorCode,
  });

  final ProductsStatus status;
  final List<ProductEntity> products;
  final ProductEntity? selectedProduct;
  final int? productSalesCount;
  final bool priceBelowCostWarning;
  final String? message;
  final String? errorCode;

  bool get canHardDelete => (productSalesCount ?? 0) == 0;

  ProductsState copyWith({
    ProductsStatus? status,
    List<ProductEntity>? products,
    ProductEntity? selectedProduct,
    int? productSalesCount,
    bool? priceBelowCostWarning,
    String? message,
    String? errorCode,
    bool clearMessage = false,
    bool clearErrorCode = false,
  }) =>
      ProductsState(
        status: status ?? this.status,
        products: products ?? this.products,
        selectedProduct: selectedProduct ?? this.selectedProduct,
        productSalesCount: productSalesCount ?? this.productSalesCount,
        priceBelowCostWarning:
            priceBelowCostWarning ?? this.priceBelowCostWarning,
        message: clearMessage ? null : (message ?? this.message),
        errorCode: clearErrorCode ? null : (errorCode ?? this.errorCode),
      );

  @override
  List<Object?> get props => [
        status,
        products,
        selectedProduct,
        productSalesCount,
        priceBelowCostWarning,
        message,
        errorCode,
      ];
}
