import '../models/app_settings_model.dart';

abstract class SettingsDataSource {
  Future<AppSettingsModel> getSettings();
  Future<AppSettingsModel> updateSettings(AppSettingsModel settings);
}
