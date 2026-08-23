import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../repositories/inventory_repository.dart';

/// Fetches inventory items, optionally filtered to low-stock only.
@injectable
class GetInventoryUseCase
    implements UseCase<List<ProductEntity>, GetInventoryParams> {
  GetInventoryUseCase(this._repository);
  final InventoryRepository _repository;
  @override
  Future<Either<Failure, List<ProductEntity>>> call(GetInventoryParams params) =>
      _repository.getInventory(lowStockOnly: params.lowStockOnly);
}
class GetInventoryParams extends Equatable {
  const GetInventoryParams({this.lowStockOnly = false});
  final bool lowStockOnly;
  @override
  List<Object?> get props => [lowStockOnly];
}
