import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/shop_profile_entity.dart';
import '../repositories/shop_repository.dart';

/// Persists shop profile changes.
@injectable
class UpdateShopProfileUseCase
    implements UseCase<ShopProfileEntity, UpdateShopProfileParams> {
  UpdateShopProfileUseCase(this._repository);

  final ShopRepository _repository;

  @override
  Future<Either<Failure, ShopProfileEntity>> call(
    UpdateShopProfileParams params,
  ) =>
      _repository.updateShopProfile(params.profile);
}

class UpdateShopProfileParams extends Equatable {
  const UpdateShopProfileParams({required this.profile});

  final ShopProfileEntity profile;

  @override
  List<Object?> get props => [profile];
}
