import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../models/app_settings_model.dart';
import 'settings_datasource.dart';

@LazySingleton(as: SettingsDataSource)
class SettingsRemoteDataSource implements SettingsDataSource {
  SettingsRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<AppSettingsModel> getSettings() async {
    try {
      final response = await _client.get(ApiEndpoints.settings);
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        AppSettingsModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AppSettingsModel> updateSettings(AppSettingsModel settings) async {
    try {
      final response = await _client.put(
        ApiEndpoints.settings,
        data: settings.toJson(),
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        AppSettingsModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
