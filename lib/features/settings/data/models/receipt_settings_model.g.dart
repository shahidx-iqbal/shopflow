// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceiptSettingsModel _$ReceiptSettingsModelFromJson(
  Map<String, dynamic> json,
) => _ReceiptSettingsModel(
  showLogo: json['show_logo'] as bool? ?? true,
  showAddress: json['show_address'] as bool? ?? true,
  showPhone: json['show_phone'] as bool? ?? true,
  showTaxNumber: json['show_tax_number'] as bool? ?? false,
  headerNote: json['header_note'] as String? ?? '',
  footerNote: json['footer_note'] as String? ?? '',
  showItemDiscount: json['show_item_discount'] as bool? ?? true,
  showTaxBreakdown: json['show_tax_breakdown'] as bool? ?? true,
  showCashierName: json['show_cashier_name'] as bool? ?? false,
  showCustomerName: json['show_customer_name'] as bool? ?? true,
  showLedgerBalance: json['show_ledger_balance'] as bool? ?? true,
  showPaymentMethod: json['show_payment_method'] as bool? ?? true,
  receiptNumberPrefix: json['receipt_number_prefix'] as String? ?? 'INV-',
  numberResetFrequency: json['number_reset_frequency'] as String? ?? 'never',
);

Map<String, dynamic> _$ReceiptSettingsModelToJson(
  _ReceiptSettingsModel instance,
) => <String, dynamic>{
  'show_logo': instance.showLogo,
  'show_address': instance.showAddress,
  'show_phone': instance.showPhone,
  'show_tax_number': instance.showTaxNumber,
  'header_note': instance.headerNote,
  'footer_note': instance.footerNote,
  'show_item_discount': instance.showItemDiscount,
  'show_tax_breakdown': instance.showTaxBreakdown,
  'show_cashier_name': instance.showCashierName,
  'show_customer_name': instance.showCustomerName,
  'show_ledger_balance': instance.showLedgerBalance,
  'show_payment_method': instance.showPaymentMethod,
  'receipt_number_prefix': instance.receiptNumberPrefix,
  'number_reset_frequency': instance.numberResetFrequency,
};
