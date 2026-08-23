import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/shop_profile_entity.dart';
import '../../domain/usecases/get_shop_profile_usecase.dart';
import '../../domain/usecases/update_shop_profile_usecase.dart';

enum ShopProfileStatus { initial, loading, loaded, saving, error }

/// Manages shop profile load and save for the Shop Profile screen.
@injectable
class ShopProfileCubit extends Cubit<ShopProfileState> {
  ShopProfileCubit(this._getProfile, this._updateProfile)
      : super(const ShopProfileState());

  final GetShopProfileUseCase _getProfile;
  final UpdateShopProfileUseCase _updateProfile;

  Future<void> loadProfile() async {
    emit(state.copyWith(status: ShopProfileStatus.loading));
    final result = await _getProfile(const NoParams());
    result.fold(
      (f) => emit(state.copyWith(
        status: ShopProfileStatus.error,
        message: f.message,
      )),
      (profile) => emit(state.copyWith(
        status: ShopProfileStatus.loaded,
        profile: profile,
      )),
    );
  }

  Future<bool> saveProfile(ShopProfileEntity profile) async {
    emit(state.copyWith(status: ShopProfileStatus.saving));
    final result = await _updateProfile(UpdateShopProfileParams(profile: profile));
    return result.fold(
      (f) {
        emit(state.copyWith(
          status: ShopProfileStatus.error,
          message: f.message,
        ));
        return false;
      },
      (updated) {
        emit(state.copyWith(
          status: ShopProfileStatus.loaded,
          profile: updated,
        ));
        return true;
      },
    );
  }
}

class ShopProfileState extends Equatable {
  const ShopProfileState({
    this.status = ShopProfileStatus.initial,
    this.profile,
    this.message,
  });

  final ShopProfileStatus status;
  final ShopProfileEntity? profile;
  final String? message;

  ShopProfileState copyWith({
    ShopProfileStatus? status,
    ShopProfileEntity? profile,
    String? message,
  }) =>
      ShopProfileState(
        status: status ?? this.status,
        profile: profile ?? this.profile,
        message: message,
      );

  @override
  List<Object?> get props => [status, profile, message];
}
