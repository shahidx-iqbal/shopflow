import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

/// Updates stock quantity for a product.
@injectable
class UpdateStockUseCase implements UseCase<ProductEntity, UpdateStockParams> {
  UpdateStockUseCase(this._repository);
  final ProductRepository _repository;

  @override
  Future<Either<Failure, ProductEntity>> call(UpdateStockParams params) {
    return _repository.updateStock(id: params.id, stock: params.stock);
  }
}

class UpdateStockParams extends Equatable {
  const UpdateStockParams({required this.id, required this.stock});
  final String id;
  final int stock;
  @override
  List<Object?> get props => [id, stock];
}
