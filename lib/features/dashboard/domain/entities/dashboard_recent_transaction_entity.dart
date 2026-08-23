import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_recent_transaction_entity.freezed.dart';

/// A single row in the dashboard recent-transactions list.
@freezed
abstract class DashboardRecentTransactionEntity
    with _$DashboardRecentTransactionEntity {
  const factory DashboardRecentTransactionEntity({
    required String id,
    required String customerName,
    required DateTime createdAt,
    required int itemCount,
    required DashboardTransactionStatus status,
    String? paymentMethod,
    required double amount,
  }) = _DashboardRecentTransactionEntity;
}

enum DashboardTransactionStatus { paid, ledger }
