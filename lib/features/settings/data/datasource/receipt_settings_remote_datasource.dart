import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../models/receipt_settings_model.dart';
import 'receipt_settings_datasource.dart';

@LazySingleton(as: ReceiptSettingsDataSource)
class ReceiptSettingsRemoteDataSource implements ReceiptSettingsDataSource {
  ReceiptSettingsRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<ReceiptSettingsModel> getReceiptSettings() async {
    try {
      final response = await _client.get('/settings/receipt');
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        ReceiptSettingsModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ReceiptSettingsModel> updateReceiptSettings(
    ReceiptSettingsModel settings,
  ) async {
    try {
      final response = await _client.put(
        '/settings/receipt',
        data: settings.toJson(),
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        ReceiptSettingsModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
