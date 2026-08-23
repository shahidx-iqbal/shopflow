import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../models/report_summary_model.dart';
import 'reports_datasource.dart';

@LazySingleton(as: ReportsDataSource)
class ReportsRemoteDataSource implements ReportsDataSource {
  ReportsRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<ReportSummaryModel> getReport({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.reports,
        queryParameters: {
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
        },
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        ReportSummaryModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
