import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../customers/domain/entities/customer_entity.dart';
import 'cart_item_entity.dart';
import 'sale_enums.dart';

part 'sale_entity.freezed.dart';

/// A completed sale transaction (Cash or Ledger).
@freezed
abstract class SaleEntity with _$SaleEntity {
  const SaleEntity._();

  const factory SaleEntity({
    @Default('') String id,
    String? invoiceNumber,
    required List<CartItemEntity> items,
    required SaleType saleType,
    CustomerEntity? customer,
    required PaymentStatus paymentStatus,
    @Default(SaleStatus.completed) SaleStatus status,
    @Default(0) double subtotal,
    @Default(0) double discount,
    @Default(0) double tax,
    required double total,
    double? cashReceived,
    double? amountPaidNow,
    double? addedToLedger,
    String? refundReason,
    DateTime? refundedAt,
    required DateTime createdAt,
  }) = _SaleEntity;

  /// Human-facing invoice number from the backend (`INV-000001`).
  String get displayInvoiceNumber {
    final number = invoiceNumber?.trim();
    if (number != null && number.isNotEmpty) return number;
    return id;
  }
}
