import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

/// Fetches the product catalog, optionally filtered by [GetProductsParams.query].
@injectable
class GetProductsUseCase
    implements UseCase<List<ProductEntity>, GetProductsParams> {
  GetProductsUseCase(this._repository);
  final ProductRepository _repository;

  @override
  Future<Either<Failure, List<ProductEntity>>> call(GetProductsParams params) {
    return _repository.getProducts(query: params.query);
  }
}

class GetProductsParams extends Equatable {
  const GetProductsParams({this.query});
  final String? query;
  @override
  List<Object?> get props => [query];
}
