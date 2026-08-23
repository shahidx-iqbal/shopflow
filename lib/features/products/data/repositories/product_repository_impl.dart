import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/barcode_utils.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasource/product_datasource.dart';
import '../models/product_model.dart';

/// [ProductRepository] — depends only on [ProductDataSource].
@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._dataSource);

  final ProductDataSource _dataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    String? query,
  }) async {
    try {
      final products = await _dataSource.getProducts(query: query);
      return Right(products.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
    String categoryId,
  ) async {
    try {
      final products = await _dataSource.getProducts();
      return Right(
        products
            .where((p) => p.categoryId == categoryId)
            .map((e) => e.toEntity())
            .toList(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> barcodeExists({
    required String barcode,
    String? excludeProductId,
  }) async {
    try {
      final normalized = BarcodeUtils.normalize(barcode);
      if (normalized.isEmpty) return const Right(false);
      final existing = await _dataSource.findByBarcode(normalized);
      if (existing == null) return const Right(false);
      if (excludeProductId != null && existing.id == excludeProductId) {
        return const Right(false);
      }
      return const Right(true);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deactivateProduct(String id) async {
    try {
      final product = await _dataSource.getProductById(id);
      await _dataSource.updateProduct(
        product.copyWith(isActive: false, updatedAt: DateTime.now()),
      );
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> reassignProductsCategory({
    required String fromCategoryId,
    required String toCategoryId,
  }) async {
    try {
      final products = await _dataSource.getProducts();
      for (final product in products) {
        if (product.categoryId == fromCategoryId) {
          await _dataSource.updateProduct(
            product.copyWith(
              categoryId: toCategoryId,
              updatedAt: DateTime.now(),
            ),
          );
        }
      }
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(String id) async {
    try {
      return Right((await _dataSource.getProductById(id)).toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductByBarcode(
    String barcode,
  ) async {
    try {
      return Right(
        (await _dataSource.getProductByBarcode(
          BarcodeUtils.normalize(barcode),
        )).toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> addProduct(
    ProductEntity product,
  ) async {
    try {
      final created = await _dataSource.createProduct(
        ProductModel.fromEntity(product),
      );
      return Right(created.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> updateProduct(
    ProductEntity product,
  ) async {
    try {
      final updated = await _dataSource.updateProduct(
        ProductModel.fromEntity(product),
      );
      return Right(updated.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String id) async {
    try {
      await _dataSource.deleteProduct(id);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> updateStock({
    required String id,
    required int stock,
  }) async {
    try {
      final updated = await _dataSource.updateStock(id: id, stock: stock);
      return Right(updated.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
