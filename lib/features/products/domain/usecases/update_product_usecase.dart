import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

/// Updates an existing product.
@injectable
class UpdateProductUseCase implements UseCase<ProductEntity, ProductEntity> {
  UpdateProductUseCase(this._repository);
  final ProductRepository _repository;

  @override
  Future<Either<Failure, ProductEntity>> call(ProductEntity params) {
    return _repository.updateProduct(params);
  }
}
