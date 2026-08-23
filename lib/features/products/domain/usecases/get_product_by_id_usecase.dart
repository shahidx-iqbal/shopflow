import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

/// Fetches a single product by its id.
@injectable
class GetProductByIdUseCase
    implements UseCase<ProductEntity, GetProductByIdParams> {
  GetProductByIdUseCase(this._repository);
  final ProductRepository _repository;

  @override
  Future<Either<Failure, ProductEntity>> call(GetProductByIdParams params) {
    return _repository.getProductById(params.id);
  }
}

class GetProductByIdParams extends Equatable {
  const GetProductByIdParams({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}
