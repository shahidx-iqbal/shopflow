import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/shop_profile_entity.dart';

/// Contract for shop profile persistence — shared with registration flow.
abstract class ShopRepository {
  Future<Either<Failure, ShopProfileEntity>> getShopProfile();
  Future<Either<Failure, ShopProfileEntity>> updateShopProfile(
    ShopProfileEntity profile,
  );
}
