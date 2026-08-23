import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../../../pos/domain/entities/sale_enums.dart';

/// Contract for sales history / invoice lookup.
abstract class SalesHistoryRepository {
  Future<Either<Failure, List<SaleEntity>>> getSales({SaleType? filter});
  Future<Either<Failure, SaleEntity>> getSaleById(String id);
}
