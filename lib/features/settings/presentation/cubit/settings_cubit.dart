import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/app_settings_entity.dart';
import '../../domain/usecases/get_settings_usecase.dart';
import '../../domain/usecases/update_settings_usecase.dart';

enum SettingsStatus { initial, loading, loaded, success, error }

class SettingsState extends Equatable {
  const SettingsState({
    this.status = SettingsStatus.initial,
    this.settings,
    this.message,
  });
  final SettingsStatus status;
  final AppSettingsEntity? settings;
  final String? message;

  SettingsState copyWith({
    SettingsStatus? status,
    AppSettingsEntity? settings,
    String? message,
  }) => SettingsState(
    status: status ?? this.status,
    settings: settings ?? this.settings,
    message: message,
  );

  @override
  List<Object?> get props => [status, settings, message];
}

/// Loads and updates shop application settings.
@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._getSettings, this._updateSettings)
      : super(const SettingsState());

  final GetSettingsUseCase _getSettings;
  final UpdateSettingsUseCase _updateSettings;

  Future<void> loadSettings() async {
    emit(state.copyWith(status: SettingsStatus.loading));
    final r = await _getSettings(const NoParams());
    r.fold(
      (f) => emit(state.copyWith(status: SettingsStatus.error, message: f.message)),
      (s) => emit(state.copyWith(status: SettingsStatus.loaded, settings: s)),
    );
  }

  Future<void> saveSettings(AppSettingsEntity settings) async {
    emit(state.copyWith(status: SettingsStatus.loading));
    final r = await _updateSettings(settings);
    r.fold(
      (f) => emit(state.copyWith(status: SettingsStatus.error, message: f.message)),
      (s) => emit(state.copyWith(status: SettingsStatus.success, settings: s)),
    );
  }
}
