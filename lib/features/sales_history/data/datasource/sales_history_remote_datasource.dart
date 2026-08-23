import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../pos/data/models/sale_model.dart';
import '../../../pos/domain/entities/sale_enums.dart';
import 'sales_history_datasource.dart';

@LazySingleton(as: SalesHistoryDataSource)
class SalesHistoryRemoteDataSource implements SalesHistoryDataSource {
  SalesHistoryRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<List<SaleModel>> getSales({SaleType? filter}) async {
    try {
      final response = await _client.get(
        ApiEndpoints.sales,
        queryParameters: filter != null ? {'sale_type': filter.name} : null,
      );
      return parseApiListData(
        response.data as Map<String, dynamic>,
        SaleModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<SaleModel> getSaleById(String id) async {
    try {
      final response = await _client.get(ApiEndpoints.saleById(id));
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        SaleModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
