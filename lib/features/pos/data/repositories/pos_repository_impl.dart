import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../../products/domain/repositories/product_repository.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/repositories/pos_repository.dart';
import '../datasource/pos_datasource.dart';
import '../models/pos_cart_draft_model.dart';
import '../models/sale_model.dart';

@LazySingleton(as: PosRepository)
class PosRepositoryImpl implements PosRepository {
  PosRepositoryImpl(this._dataSource, this._productRepository);

  final PosDataSource _dataSource;
  final ProductRepository _productRepository;

  @override
  Future<Either<Failure, SaleEntity>> saveSale(SaleEntity sale) async {
    try {
      return Right(
        (await _dataSource.saveSale(SaleModel.fromEntity(sale))).toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SaleEntity>> updateSale(SaleEntity sale) async {
    try {
      return Right(
        (await _dataSource.updateSale(SaleModel.fromEntity(sale))).toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SaleEntity>> refundSale({
    required String saleId,
    required String reason,
  }) async {
    try {
      return Right(
        (await _dataSource.refundSale(id: saleId, reason: reason)).toEntity(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SaleEntity>> getSaleById(String id) async {
    try {
      return Right((await _dataSource.getSaleById(id)).toEntity());
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
    final result = await _productRepository.getProductByBarcode(barcode);
    return result.fold(
      Left.new,
      (product) {
        if (!product.isActive) {
          return const Left(
            ServerFailure(
              message: 'Product not found',
              code: 'product_not_found',
            ),
          );
        }
        return Right(product);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> saveCartDraft(PosCartDraftModel draft) async {
    try {
      await _dataSource.saveCartDraft(draft);
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PosCartDraftModel?>> loadCartDraft() async {
    try {
      return Right(await _dataSource.loadCartDraft());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearCartDraft() async {
    try {
      await _dataSource.clearCartDraft();
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
