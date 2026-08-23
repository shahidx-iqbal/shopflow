import '../models/product_model.dart';

/// Contract for product data operations.
abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts({String? query});
  Future<ProductModel> getProductById(String id);
  Future<ProductModel> getProductByBarcode(String barcode);
  Future<ProductModel?> findByBarcode(String barcode);
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
  Future<ProductModel> updateStock({required String id, required int stock});
}
