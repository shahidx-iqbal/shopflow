import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/product_repository.dart';

/// Deletes a product by id.
@injectable
class DeleteProductUseCase implements UseCase<Unit, DeleteProductParams> {
  DeleteProductUseCase(this._repository);
  final ProductRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(DeleteProductParams params) {
    return _repository.deleteProduct(params.id);
  }
}

class DeleteProductParams extends Equatable {
  const DeleteProductParams({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}
