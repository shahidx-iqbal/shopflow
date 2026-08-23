import 'package:freezed_annotation/freezed_annotation.dart';

import 'dashboard_recent_transaction_entity.dart';
import 'dashboard_top_product_entity.dart';

part 'dashboard_summary_entity.freezed.dart';

/// Aggregated metrics and lists shown on the home dashboard.
@freezed
abstract class DashboardSummaryEntity with _$DashboardSummaryEntity {
  const factory DashboardSummaryEntity({
    @Default('') String shopName,
    @Default(0) double todaySales,
    @Default(0) double salesGrowthPercent,
    @Default(0) int lowStockCount,
    @Default(0) double pendingLedgerAmount,
    @Default(0) int pendingLedgerAccountsCount,
    @Default([]) List<DashboardRecentTransactionEntity> recentTransactions,
    @Default([]) List<DashboardTopProductEntity> topSellingProducts,
  }) = _DashboardSummaryEntity;
}
