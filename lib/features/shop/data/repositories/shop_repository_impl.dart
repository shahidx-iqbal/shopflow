import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/shop_profile_entity.dart';
import '../../domain/repositories/shop_repository.dart';
import '../datasources/shop_datasource.dart';
import '../models/shop_profile_model.dart';

@LazySingleton(as: ShopRepository)
class ShopRepositoryImpl implements ShopRepository {
  ShopRepositoryImpl(this._dataSource);

  final ShopDataSource _dataSource;

  @override
  Future<Either<Failure, ShopProfileEntity>> getShopProfile() async {
    try {
      return Right((await _dataSource.getShopProfile()).toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShopProfileEntity>> updateShopProfile(
    ShopProfileEntity profile,
  ) async {
    try {
      final updated = await _dataSource.updateShopProfile(
        ShopProfileModel.fromEntity(profile),
      );
      return Right(updated.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
