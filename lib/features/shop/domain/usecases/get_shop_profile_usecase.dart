import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/shop_profile_entity.dart';
import '../repositories/shop_repository.dart';

/// Loads the current shop profile.
@injectable
class GetShopProfileUseCase implements UseCase<ShopProfileEntity, NoParams> {
  GetShopProfileUseCase(this._repository);

  final ShopRepository _repository;

  @override
  Future<Either<Failure, ShopProfileEntity>> call(NoParams params) =>
      _repository.getShopProfile();
}
