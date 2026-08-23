import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/category_repository.dart';

/// Deletes a category by id.
@injectable
class DeleteCategoryUseCase implements UseCase<Unit, DeleteCategoryParams> {
  DeleteCategoryUseCase(this._repository);
  final CategoryRepository _repository;
  @override
  Future<Either<Failure, Unit>> call(DeleteCategoryParams params) =>
      _repository.deleteCategory(params.id);
}
class DeleteCategoryParams extends Equatable {
  const DeleteCategoryParams({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}
