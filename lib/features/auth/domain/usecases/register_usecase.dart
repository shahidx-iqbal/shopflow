import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../shop/domain/entities/shop_profile_entity.dart';
import '../../../shop/domain/repositories/shop_repository.dart';
import '../entities/auth_session_entity.dart';
import '../repositories/auth_repository.dart';

/// Registers a new shop owner account and seeds the shop profile.
@injectable
class RegisterUseCase implements UseCase<AuthSessionEntity, RegisterParams> {
  RegisterUseCase(this._authRepository, this._shopRepository);

  final AuthRepository _authRepository;
  final ShopRepository _shopRepository;

  @override
  Future<Either<Failure, AuthSessionEntity>> call(RegisterParams params) async {
    final result = await _authRepository.register(
      name: params.name,
      shopName: params.shopName,
      phone: params.phone,
      email: params.email,
      password: params.password,
    );

    return result.fold(Left.new, (session) async {
      await _shopRepository.updateShopProfile(
        ShopProfileEntity(
          shopName: params.shopName,
          ownerName: params.name,
          phone: params.phone,
          address: params.address,
          logoPath: params.logoPath,
        ),
      );
      return Right(session);
    });
  }
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.shopName,
    required this.phone,
    this.email,
    required this.password,
    this.address,
    this.logoPath,
  });

  final String name;
  final String shopName;
  final String phone;
  final String? email;
  final String password;
  final String? address;
  final String? logoPath;

  @override
  List<Object?> get props =>
      [name, shopName, phone, email, password, address, logoPath];
}
