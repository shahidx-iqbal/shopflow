import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/product_repository.dart';

/// Sets [ProductEntity.isActive] to false — product stays in history/invoices.
@injectable
class DeactivateProductUseCase implements UseCase<Unit, DeactivateProductParams> {
  DeactivateProductUseCase(this._repository);

  final ProductRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(DeactivateProductParams params) =>
      _repository.deactivateProduct(params.id);
}

class DeactivateProductParams extends Equatable {
  const DeactivateProductParams({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}
