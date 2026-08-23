import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/dashboard_recent_transaction_entity.dart';

part 'dashboard_recent_transaction_model.freezed.dart';
part 'dashboard_recent_transaction_model.g.dart';

@freezed
abstract class DashboardRecentTransactionModel
    with _$DashboardRecentTransactionModel {
  const DashboardRecentTransactionModel._();

  const factory DashboardRecentTransactionModel({
    required String id,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'item_count') required int itemCount,
    required DashboardTransactionStatus status,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    required double amount,
  }) = _DashboardRecentTransactionModel;

  factory DashboardRecentTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardRecentTransactionModelFromJson(json);

  DashboardRecentTransactionEntity toEntity() =>
      DashboardRecentTransactionEntity(
        id: id,
        customerName: customerName,
        createdAt: createdAt,
        itemCount: itemCount,
        status: status,
        paymentMethod: paymentMethod,
        amount: amount,
      );
}
