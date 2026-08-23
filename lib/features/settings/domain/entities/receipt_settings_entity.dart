import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_settings_entity.freezed.dart';

/// How often the receipt sequence number resets.
enum ReceiptResetFrequency {
  never,
  daily,
  monthly,
}

/// Receipt template visibility and formatting options.
@freezed
abstract class ReceiptSettingsEntity with _$ReceiptSettingsEntity {
  const factory ReceiptSettingsEntity({
    @Default(true) bool showLogo,
    @Default(true) bool showAddress,
    @Default(true) bool showPhone,
    @Default(false) bool showTaxNumber,
    @Default('') String headerNote,
    @Default('') String footerNote,
    @Default(true) bool showItemDiscount,
    @Default(true) bool showTaxBreakdown,
    @Default(false) bool showCashierName,
    @Default(true) bool showCustomerName,
    @Default(true) bool showLedgerBalance,
    @Default(true) bool showPaymentMethod,
    @Default('INV-') String receiptNumberPrefix,
    @Default(ReceiptResetFrequency.never)
    ReceiptResetFrequency numberResetFrequency,
  }) = _ReceiptSettingsEntity;
}
