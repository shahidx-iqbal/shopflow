import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../models/category_model.dart';
import 'category_datasource.dart';

@LazySingleton(as: CategoryDataSource)
class CategoryRemoteDataSource implements CategoryDataSource {
  CategoryRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _client.get(ApiEndpoints.categories);
      return parseApiListData(
        response.data as Map<String, dynamic>,
        CategoryModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<CategoryModel> getCategoryById(String id) async {
    try {
      final response = await _client.get(ApiEndpoints.categoryById(id));
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        CategoryModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<CategoryModel> createCategory(CategoryModel category) async {
    try {
      final payload = Map<String, dynamic>.from(category.toJson());
      if (category.id.isEmpty) {
        payload.remove('id');
      }
      final response = await _client.post(
        ApiEndpoints.categories,
        data: payload,
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        CategoryModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<CategoryModel> updateCategory(CategoryModel category) async {
    try {
      final response = await _client.put(
        ApiEndpoints.categoryById(category.id),
        data: category.toJson(),
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        CategoryModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteCategory(String id) async {
    try {
      await _client.delete(ApiEndpoints.categoryById(id));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
