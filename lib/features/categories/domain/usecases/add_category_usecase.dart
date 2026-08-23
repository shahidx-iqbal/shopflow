import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';

/// Creates a new product category.
@injectable
class AddCategoryUseCase implements UseCase<CategoryEntity, CategoryEntity> {
  AddCategoryUseCase(this._repository);
  final CategoryRepository _repository;
  @override
  Future<Either<Failure, CategoryEntity>> call(CategoryEntity params) =>
      _repository.addCategory(params);
}
