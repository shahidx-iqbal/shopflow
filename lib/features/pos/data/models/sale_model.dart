import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../customers/data/models/customer_model.dart';
import '../../domain/entities/sale_entity.dart';
import '../../domain/entities/sale_enums.dart';
import 'cart_item_model.dart';

part 'sale_model.freezed.dart';
part 'sale_model.g.dart';

@freezed
abstract class SaleModel with _$SaleModel {
  const SaleModel._();

  @JsonSerializable(explicitToJson: true)
  const factory SaleModel({
    @Default('') String id,
    @JsonKey(name: 'invoice_number', includeToJson: false) String? invoiceNumber,
    required List<CartItemModel> items,
    @JsonKey(name: 'sale_type') required SaleType saleType,
    CustomerModel? customer,
    @JsonKey(name: 'payment_status') required PaymentStatus paymentStatus,
    @Default('completed')
    @JsonKey(name: 'status')
    String status,
    @Default(0) double subtotal,
    @Default(0) double discount,
    @Default(0) double tax,
    required double total,
    @JsonKey(name: 'cash_received') double? cashReceived,
    @JsonKey(name: 'amount_paid_now') double? amountPaidNow,
    @JsonKey(name: 'added_to_ledger') double? addedToLedger,
    @JsonKey(name: 'refund_reason') String? refundReason,
    @JsonKey(name: 'refunded_at') DateTime? refundedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);

  factory SaleModel.fromEntity(SaleEntity e) => SaleModel(
        id: e.id,
        invoiceNumber: e.invoiceNumber,
        items: e.items.map(CartItemModel.fromEntity).toList(),
        saleType: e.saleType,
        customer:
            e.customer != null ? CustomerModel.fromEntity(e.customer!) : null,
        paymentStatus: e.paymentStatus,
        status: e.status.name,
        subtotal: e.subtotal,
        discount: e.discount,
        tax: e.tax,
        total: e.total,
        cashReceived: e.cashReceived,
        amountPaidNow: e.amountPaidNow,
        addedToLedger: e.addedToLedger,
        refundReason: e.refundReason,
        refundedAt: e.refundedAt,
        createdAt: e.createdAt,
      );

  SaleEntity toEntity() => SaleEntity(
        id: id,
        invoiceNumber: invoiceNumber,
        items: items.map((e) => e.toEntity()).toList(),
        saleType: saleType,
        customer: customer?.toEntity(),
        paymentStatus: paymentStatus,
        status: SaleStatus.values.firstWhere(
          (s) => s.name == status,
          orElse: () => SaleStatus.completed,
        ),
        subtotal: subtotal,
        discount: discount,
        tax: tax,
        total: total,
        cashReceived: cashReceived,
        amountPaidNow: amountPaidNow,
        addedToLedger: addedToLedger,
        refundReason: refundReason,
        refundedAt: refundedAt,
        createdAt: createdAt,
      );
}
