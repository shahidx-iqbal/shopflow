import '../models/category_model.dart';

abstract class CategoryDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel> getCategoryById(String id);
  Future<CategoryModel> createCategory(CategoryModel category);
  Future<CategoryModel> updateCategory(CategoryModel category);
  Future<void> deleteCategory(String id);
}
