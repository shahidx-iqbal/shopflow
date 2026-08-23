import 'receipt_data.dart';

/// Plain-text receipt body for share / messaging apps.
class ReceiptTextBuilder {
  ReceiptTextBuilder._();

  static String build(ReceiptData data) {
    final buffer = StringBuffer()
      ..writeln(data.shopName)
      ..writeln('${data.receiptNumber} • ${data.dateLabel}');

    if (data.address != null) buffer.writeln(data.address);
    if (data.phone != null) buffer.writeln(data.phone);
    if (data.taxNumberLine != null) buffer.writeln(data.taxNumberLine);
    if (data.headerNote != null) buffer.writeln(data.headerNote);
    if (data.customerLine != null) buffer.writeln(data.customerLine);
    if (data.cashierLine != null) buffer.writeln(data.cashierLine);

    buffer.writeln('');
    for (final line in data.lines) {
      buffer.writeln(line.name);
      buffer.writeln('  ${line.qtyLabel} — ${line.amount}');
      if (line.discountLine != null) buffer.writeln('  ${line.discountLine}');
    }

    for (final row in data.summaryRows) {
      buffer.writeln('${row.label}: ${row.amount}');
    }

    buffer.writeln('${data.totalLabel}: ${data.totalAmount}');

    if (data.paymentMethodLine != null) buffer.writeln(data.paymentMethodLine);
    for (final row in data.paymentRows) {
      buffer.writeln('${row.label}: ${row.amount}');
    }
    if (data.ledgerBalanceLine != null) buffer.writeln(data.ledgerBalanceLine);
    if (data.footerNote != null) {
      buffer.writeln('');
      buffer.writeln(data.footerNote);
    }

    return buffer.toString();
  }
}
