import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/receipt_settings_entity.dart';
import '../../domain/usecases/get_receipt_settings_usecase.dart';
import '../../domain/usecases/update_receipt_settings_usecase.dart';

enum ReceiptSettingsStatus { initial, loading, loaded, saving, error }

/// Manages receipt template toggles and autosave with debounce for text fields.
@injectable
class ReceiptSettingsCubit extends Cubit<ReceiptSettingsState> {
  ReceiptSettingsCubit(this._getSettings, this._updateSettings)
      : super(const ReceiptSettingsState());

  final GetReceiptSettingsUseCase _getSettings;
  final UpdateReceiptSettingsUseCase _updateSettings;
  Timer? _debounce;

  Future<void> loadSettings() async {
    emit(state.copyWith(status: ReceiptSettingsStatus.loading));
    final result = await _getSettings(const NoParams());
    result.fold(
      (f) => emit(state.copyWith(
        status: ReceiptSettingsStatus.error,
        message: f.message,
      )),
      (settings) => emit(state.copyWith(
        status: ReceiptSettingsStatus.loaded,
        settings: settings,
      )),
    );
  }

  void updateSettings(ReceiptSettingsEntity settings, {bool debounce = false}) {
    emit(state.copyWith(settings: settings));
    if (debounce) {
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 600), () {
        _persist(settings);
      });
    } else {
      _persist(settings);
    }
  }

  Future<void> _persist(ReceiptSettingsEntity settings) async {
    emit(state.copyWith(status: ReceiptSettingsStatus.saving));
    final result =
        await _updateSettings(UpdateReceiptSettingsParams(settings: settings));
    result.fold(
      (f) => emit(state.copyWith(
        status: ReceiptSettingsStatus.error,
        message: f.message,
      )),
      (saved) => emit(state.copyWith(
        status: ReceiptSettingsStatus.loaded,
        settings: saved,
      )),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}

class ReceiptSettingsState extends Equatable {
  const ReceiptSettingsState({
    this.status = ReceiptSettingsStatus.initial,
    this.settings,
    this.message,
  });

  final ReceiptSettingsStatus status;
  final ReceiptSettingsEntity? settings;
  final String? message;

  ReceiptSettingsState copyWith({
    ReceiptSettingsStatus? status,
    ReceiptSettingsEntity? settings,
    String? message,
  }) =>
      ReceiptSettingsState(
        status: status ?? this.status,
        settings: settings ?? this.settings,
        message: message,
      );

  @override
  List<Object?> get props => [status, settings, message];
}
