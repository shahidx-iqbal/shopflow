import '../models/shop_profile_model.dart';

/// Remote/local shop profile data access.
abstract class ShopDataSource {
  Future<ShopProfileModel> getShopProfile();
  Future<ShopProfileModel> updateShopProfile(ShopProfileModel profile);
}
