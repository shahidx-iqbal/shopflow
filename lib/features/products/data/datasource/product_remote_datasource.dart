import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/image_write_payload.dart';
import '../models/product_model.dart';
import 'product_datasource.dart';

/// Remote REST implementation — ready for the real backend.
@LazySingleton(as: ProductDataSource)
class ProductRemoteDataSource implements ProductDataSource {
  ProductRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<List<ProductModel>> getProducts({String? query}) async {
    try {
      final response = await _client.get(
        ApiEndpoints.products,
        queryParameters: query != null ? {'q': query} : null,
      );
      final body = response.data as Map<String, dynamic>;
      return parseApiListData(body, ProductModel.fromJson);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    try {
      final response = await _client.get(ApiEndpoints.productById(id));
      final body = response.data as Map<String, dynamic>;
      return parseApiObjectData(body, ProductModel.fromJson);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ProductModel?> findByBarcode(String barcode) async {
    try {
      return await getProductByBarcode(barcode);
    } on ServerException {
      return null;
    }
  }

  @override
  Future<ProductModel> getProductByBarcode(String barcode) async {
    try {
      final response =
          await _client.get(ApiEndpoints.productByBarcode(barcode));
      final body = response.data as Map<String, dynamic>;
      return parseApiObjectData(body, ProductModel.fromJson);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    try {
      final response = await _client.post(
        ApiEndpoints.products,
        data: await _productPayload(product, isCreate: true),
      );
      final body = response.data as Map<String, dynamic>;
      return parseApiObjectData(body, ProductModel.fromJson);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    try {
      final response = await _client.put(
        ApiEndpoints.productById(product.id),
        data: await _productPayload(product, isCreate: false),
      );
      final body = response.data as Map<String, dynamic>;
      return parseApiObjectData(body, ProductModel.fromJson);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    try {
      await _client.delete(ApiEndpoints.productById(id));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ProductModel> updateStock({
    required String id,
    required int stock,
  }) async {
    try {
      final response = await _client.patch(
        ApiEndpoints.productById(id),
        data: {'stock': stock},
      );
      final body = response.data as Map<String, dynamic>;
      return parseApiObjectData(body, ProductModel.fromJson);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<dynamic> _productPayload(
    ProductModel product, {
    required bool isCreate,
  }) {
    final json = product.toJson();
    if (isCreate || product.id.isEmpty) {
      json.remove('id');
    }
    json.remove('created_at');
    json.remove('updated_at');
    json.remove('category_name');
    return imageWritePayload(
      fields: json,
      imagePath: product.imageUrl,
      fileField: 'image',
      urlField: 'image_url',
    );
  }
}
