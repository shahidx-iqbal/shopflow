import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../entities/sale_entity.dart';
import '../../data/models/pos_cart_draft_model.dart';

/// Contract for POS checkout, sale persistence, and cart draft storage.
abstract class PosRepository {
  Future<Either<Failure, SaleEntity>> saveSale(SaleEntity sale);
  Future<Either<Failure, SaleEntity>> updateSale(SaleEntity sale);
  Future<Either<Failure, SaleEntity>> refundSale({
    required String saleId,
    required String reason,
  });
  Future<Either<Failure, SaleEntity>> getSaleById(String id);
  Future<Either<Failure, ProductEntity>> getProductByBarcode(String barcode);
  Future<Either<Failure, Unit>> saveCartDraft(PosCartDraftModel draft);
  Future<Either<Failure, PosCartDraftModel?>> loadCartDraft();
  Future<Either<Failure, Unit>> clearCartDraft();
}
