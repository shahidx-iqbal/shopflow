import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../../products/domain/usecases/get_products_by_category_usecase.dart';
import '../../../products/domain/usecases/reassign_products_category_usecase.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/usecases/add_category_usecase.dart';
import '../../domain/usecases/delete_category_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/update_category_usecase.dart';

enum CategoriesStatus {
  initial,
  loading,
  loaded,
  success,
  deleted,
  error,
}

class CategoriesState extends Equatable {
  const CategoriesState({
    this.status = CategoriesStatus.initial,
    this.categories = const [],
    this.message,
  });

  final CategoriesStatus status;
  final List<CategoryEntity> categories;
  final String? message;

  CategoriesState copyWith({
    CategoriesStatus? status,
    List<CategoryEntity>? categories,
    String? message,
  }) =>
      CategoriesState(
        status: status ?? this.status,
        categories: categories ?? this.categories,
        message: message,
      );

  @override
  List<Object?> get props => [status, categories, message];
}

/// Simple Cubit for category list and CRUD actions.
@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(
    this._getCategories,
    this._addCategory,
    this._updateCategory,
    this._deleteCategory,
    this._getProductsByCategory,
    this._reassignProductsCategory,
  ) : super(const CategoriesState());

  final GetCategoriesUseCase _getCategories;
  final AddCategoryUseCase _addCategory;
  final UpdateCategoryUseCase _updateCategory;
  final DeleteCategoryUseCase _deleteCategory;
  final GetProductsByCategoryUseCase _getProductsByCategory;
  final ReassignProductsCategoryUseCase _reassignProductsCategory;

  Future<void> loadCategories() async {
    emit(state.copyWith(status: CategoriesStatus.loading));
    final r = await _getCategories(const NoParams());
    r.fold(
      (f) => emit(
        state.copyWith(status: CategoriesStatus.error, message: f.message),
      ),
      (list) => emit(
        state.copyWith(status: CategoriesStatus.loaded, categories: list),
      ),
    );
  }

  Future<void> addCategory(CategoryEntity category) async {
    emit(state.copyWith(status: CategoriesStatus.loading));
    final result = await _addCategory(category);
    await result.fold(
      (failure) async => emit(
        state.copyWith(status: CategoriesStatus.error, message: failure.message),
      ),
      (_) async {
        emit(state.copyWith(status: CategoriesStatus.success));
        await loadCategories();
      },
    );
  }

  Future<void> updateCategory(CategoryEntity category) async {
    emit(state.copyWith(status: CategoriesStatus.loading));
    final result = await _updateCategory(category);
    await result.fold(
      (failure) async => emit(
        state.copyWith(status: CategoriesStatus.error, message: failure.message),
      ),
      (_) async {
        emit(state.copyWith(status: CategoriesStatus.success));
        await loadCategories();
      },
    );
  }

  Future<List<ProductEntity>> productsInCategory(String categoryId) async {
    final result = await _getProductsByCategory(
      GetProductsByCategoryParams(categoryId: categoryId),
    );
    return result.fold((_) => <ProductEntity>[], (products) => products);
  }

  Future<void> reassignProductsAndDelete({
    required String fromCategoryId,
    required String toCategoryId,
  }) async {
    emit(state.copyWith(status: CategoriesStatus.loading));
    final reassign = await _reassignProductsCategory(
      ReassignProductsCategoryParams(
        fromCategoryId: fromCategoryId,
        toCategoryId: toCategoryId,
      ),
    );
    await reassign.fold(
      (f) async => emit(
        state.copyWith(status: CategoriesStatus.error, message: f.message),
      ),
      (_) async => deleteCategory(fromCategoryId),
    );
  }

  Future<void> deleteCategory(String id) async {
    emit(state.copyWith(status: CategoriesStatus.loading));
    final result = await _deleteCategory(DeleteCategoryParams(id: id));
    await result.fold(
      (failure) async => emit(
        state.copyWith(status: CategoriesStatus.error, message: failure.message),
      ),
      (_) async {
        emit(state.copyWith(status: CategoriesStatus.deleted));
        await loadCategories();
      },
    );
  }
}
