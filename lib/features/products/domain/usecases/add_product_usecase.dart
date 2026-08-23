import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

/// Creates a new product in the catalog.
@injectable
class AddProductUseCase implements UseCase<ProductEntity, ProductEntity> {
  AddProductUseCase(this._repository);
  final ProductRepository _repository;

  @override
  Future<Either<Failure, ProductEntity>> call(ProductEntity params) {
    return _repository.addProduct(params);
  }
}
