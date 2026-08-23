import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';

/// Updates an existing category.
@injectable
class UpdateCategoryUseCase implements UseCase<CategoryEntity, CategoryEntity> {
  UpdateCategoryUseCase(this._repository);
  final CategoryRepository _repository;
  @override
  Future<Either<Failure, CategoryEntity>> call(CategoryEntity params) =>
      _repository.updateCategory(params);
}
