import '../models/receipt_settings_model.dart';

abstract class ReceiptSettingsDataSource {
  Future<ReceiptSettingsModel> getReceiptSettings();
  Future<ReceiptSettingsModel> updateReceiptSettings(
    ReceiptSettingsModel settings,
  );
}
