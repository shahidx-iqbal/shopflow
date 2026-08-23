import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../models/dashboard_summary_model.dart';
import 'dashboard_datasource.dart';

@LazySingleton(as: DashboardDataSource)
class DashboardRemoteDataSource implements DashboardDataSource {
  DashboardRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<DashboardSummaryModel> getSummary() async {
    try {
      final response = await _client.get(ApiEndpoints.dashboard);
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        DashboardSummaryModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
