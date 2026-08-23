import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../products/data/models/product_model.dart';
import '../models/stock_adjustment_model.dart';
import 'inventory_datasource.dart';

@LazySingleton(as: InventoryDataSource)
class InventoryRemoteDataSource implements InventoryDataSource {
  InventoryRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<List<ProductModel>> getInventory({bool lowStockOnly = false}) async {
    try {
      final response = await _client.get(
        ApiEndpoints.inventory,
        queryParameters: {'low_stock': lowStockOnly},
      );
      return parseApiListData(
        response.data as Map<String, dynamic>,
        ProductModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<StockAdjustmentModel> adjustStock({
    required String productId,
    required int newStock,
    required String reason,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.stockAdjustment,
        data: {
          'product_id': productId,
          'new_stock': newStock,
          'reason': reason,
        },
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        StockAdjustmentModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
