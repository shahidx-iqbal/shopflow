import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

/// Lists products assigned to a category — used before category deletion.
@injectable
class GetProductsByCategoryUseCase
    implements UseCase<List<ProductEntity>, GetProductsByCategoryParams> {
  GetProductsByCategoryUseCase(this._repository);

  final ProductRepository _repository;

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
    GetProductsByCategoryParams params,
  ) =>
      _repository.getProductsByCategory(params.categoryId);
}

class GetProductsByCategoryParams extends Equatable {
  const GetProductsByCategoryParams({required this.categoryId});

  final String categoryId;

  @override
  List<Object?> get props => [categoryId];
}
