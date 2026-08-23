import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/local_storage/shared_prefs_service.dart';

/// App-wide locale state — persisted via [SharedPrefsService].
@lazySingleton
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this._prefs) : super(Locale(_prefs.selectedLocale));

  final SharedPrefsService _prefs;

  Future<void> load() async {
    emit(Locale(_prefs.selectedLocale));
  }

  Future<void> setLocale(Locale locale) async {
    await _prefs.setSelectedLocale(locale.languageCode);
    emit(locale);
  }
}
