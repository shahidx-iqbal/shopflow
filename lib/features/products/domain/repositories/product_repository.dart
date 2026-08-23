import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/product_entity.dart';

/// Contract for product catalog operations.
abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts({String? query});
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
    String categoryId,
  );
  Future<Either<Failure, ProductEntity>> getProductById(String id);
  Future<Either<Failure, ProductEntity>> getProductByBarcode(String barcode);
  Future<Either<Failure, bool>> barcodeExists({
    required String barcode,
    String? excludeProductId,
  });
  Future<Either<Failure, ProductEntity>> addProduct(ProductEntity product);
  Future<Either<Failure, ProductEntity>> updateProduct(ProductEntity product);
  Future<Either<Failure, Unit>> deleteProduct(String id);
  Future<Either<Failure, Unit>> deactivateProduct(String id);
  Future<Either<Failure, Unit>> reassignProductsCategory({
    required String fromCategoryId,
    required String toCategoryId,
  });
  Future<Either<Failure, ProductEntity>> updateStock({
    required String id,
    required int stock,
  });
}
