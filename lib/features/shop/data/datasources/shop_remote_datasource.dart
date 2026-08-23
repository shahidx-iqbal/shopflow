import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/image_write_payload.dart';
import '../models/shop_profile_model.dart';
import 'shop_datasource.dart';

@LazySingleton(as: ShopDataSource)
class ShopRemoteDataSource implements ShopDataSource {
  ShopRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<ShopProfileModel> getShopProfile() async {
    try {
      final response = await _client.get('/shop/profile');
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        ShopProfileModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ShopProfileModel> updateShopProfile(ShopProfileModel profile) async {
    try {
      final response = await _client.put(
        '/shop/profile',
        data: await imageWritePayload(
          fields: profile.toJson(),
          imagePath: profile.logoPath,
          fileField: 'logo',
          urlField: 'logo_path',
          extraUrlFields: const ['logo_url'],
        ),
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        ShopProfileModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
