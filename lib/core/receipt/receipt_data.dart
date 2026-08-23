import 'package:equatable/equatable.dart';

/// Structured receipt content produced by [ReceiptTemplateBuilder].
class ReceiptData extends Equatable {
  const ReceiptData({
    required this.shopName,
    required this.receiptNumber,
    required this.dateLabel,
    required this.lines,
    required this.totalLabel,
    required this.totalAmount,
    this.logoPath,
    this.address,
    this.phone,
    this.taxNumberLine,
    this.headerNote,
    this.footerNote,
    this.customerLine,
    this.cashierLine,
    this.paymentMethodLine,
    this.ledgerBalanceLine,
    this.summaryRows = const [],
    this.paymentRows = const [],
  });

  final String shopName;
  final String receiptNumber;
  final String dateLabel;
  final List<ReceiptLineItem> lines;
  final String totalLabel;
  final String totalAmount;
  final String? logoPath;
  final String? address;
  final String? phone;
  final String? taxNumberLine;
  final String? headerNote;
  final String? footerNote;
  final String? customerLine;
  final String? cashierLine;
  final String? paymentMethodLine;
  final String? ledgerBalanceLine;
  final List<ReceiptSummaryRow> summaryRows;
  final List<ReceiptSummaryRow> paymentRows;

  @override
  List<Object?> get props => [
        shopName,
        receiptNumber,
        dateLabel,
        lines,
        totalLabel,
        totalAmount,
        logoPath,
        address,
        phone,
        taxNumberLine,
        headerNote,
        footerNote,
        customerLine,
        cashierLine,
        paymentMethodLine,
        ledgerBalanceLine,
        summaryRows,
        paymentRows,
      ];
}

class ReceiptLineItem extends Equatable {
  const ReceiptLineItem({
    required this.name,
    required this.qtyLabel,
    required this.amount,
    this.discountLine,
  });

  final String name;
  final String qtyLabel;
  final String amount;
  final String? discountLine;

  @override
  List<Object?> get props => [name, qtyLabel, amount, discountLine];
}

class ReceiptSummaryRow extends Equatable {
  const ReceiptSummaryRow({
    required this.label,
    required this.amount,
    this.emphasized = false,
  });

  final String label;
  final String amount;
  final bool emphasized;

  @override
  List<Object?> get props => [label, amount, emphasized];
}
