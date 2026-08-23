import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/receipt_settings_entity.dart';

part 'receipt_settings_model.freezed.dart';
part 'receipt_settings_model.g.dart';

@freezed
abstract class ReceiptSettingsModel with _$ReceiptSettingsModel {
  const ReceiptSettingsModel._();

  const factory ReceiptSettingsModel({
    @JsonKey(name: 'show_logo') @Default(true) bool showLogo,
    @JsonKey(name: 'show_address') @Default(true) bool showAddress,
    @JsonKey(name: 'show_phone') @Default(true) bool showPhone,
    @JsonKey(name: 'show_tax_number') @Default(false) bool showTaxNumber,
    @JsonKey(name: 'header_note') @Default('') String headerNote,
    @JsonKey(name: 'footer_note') @Default('') String footerNote,
    @JsonKey(name: 'show_item_discount') @Default(true) bool showItemDiscount,
    @JsonKey(name: 'show_tax_breakdown') @Default(true) bool showTaxBreakdown,
    @JsonKey(name: 'show_cashier_name') @Default(false) bool showCashierName,
    @JsonKey(name: 'show_customer_name') @Default(true) bool showCustomerName,
    @JsonKey(name: 'show_ledger_balance') @Default(true) bool showLedgerBalance,
    @JsonKey(name: 'show_payment_method') @Default(true) bool showPaymentMethod,
    @JsonKey(name: 'receipt_number_prefix')
    @Default('INV-')
    String receiptNumberPrefix,
    @JsonKey(name: 'number_reset_frequency')
    @Default('never')
    String numberResetFrequency,
  }) = _ReceiptSettingsModel;

  factory ReceiptSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptSettingsModelFromJson(json);

  factory ReceiptSettingsModel.fromEntity(ReceiptSettingsEntity entity) =>
      ReceiptSettingsModel(
        showLogo: entity.showLogo,
        showAddress: entity.showAddress,
        showPhone: entity.showPhone,
        showTaxNumber: entity.showTaxNumber,
        headerNote: entity.headerNote,
        footerNote: entity.footerNote,
        showItemDiscount: entity.showItemDiscount,
        showTaxBreakdown: entity.showTaxBreakdown,
        showCashierName: entity.showCashierName,
        showCustomerName: entity.showCustomerName,
        showLedgerBalance: entity.showLedgerBalance,
        showPaymentMethod: entity.showPaymentMethod,
        receiptNumberPrefix: entity.receiptNumberPrefix,
        numberResetFrequency: entity.numberResetFrequency.name,
      );

  ReceiptSettingsEntity toEntity() => ReceiptSettingsEntity(
        showLogo: showLogo,
        showAddress: showAddress,
        showPhone: showPhone,
        showTaxNumber: showTaxNumber,
        headerNote: headerNote,
        footerNote: footerNote,
        showItemDiscount: showItemDiscount,
        showTaxBreakdown: showTaxBreakdown,
        showCashierName: showCashierName,
        showCustomerName: showCustomerName,
        showLedgerBalance: showLedgerBalance,
        showPaymentMethod: showPaymentMethod,
        receiptNumberPrefix: receiptNumberPrefix,
        numberResetFrequency: ReceiptResetFrequency.values.firstWhere(
          (e) => e.name == numberResetFrequency,
          orElse: () => ReceiptResetFrequency.never,
        ),
      );
}
