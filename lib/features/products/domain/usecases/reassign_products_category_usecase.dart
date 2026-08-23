import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/product_repository.dart';

/// Moves all products from one category to another before category deletion.
@injectable
class ReassignProductsCategoryUseCase
    implements UseCase<Unit, ReassignProductsCategoryParams> {
  ReassignProductsCategoryUseCase(this._repository);

  final ProductRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(ReassignProductsCategoryParams params) =>
      _repository.reassignProductsCategory(
        fromCategoryId: params.fromCategoryId,
        toCategoryId: params.toCategoryId,
      );
}

class ReassignProductsCategoryParams extends Equatable {
  const ReassignProductsCategoryParams({
    required this.fromCategoryId,
    required this.toCategoryId,
  });

  final String fromCategoryId;
  final String toCategoryId;

  @override
  List<Object?> get props => [fromCategoryId, toCategoryId];
}
