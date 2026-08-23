import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/dashboard_summary_entity.dart';
import 'dashboard_recent_transaction_model.dart';
import 'dashboard_top_product_model.dart';

part 'dashboard_summary_model.freezed.dart';
part 'dashboard_summary_model.g.dart';

@freezed
abstract class DashboardSummaryModel with _$DashboardSummaryModel {
  const DashboardSummaryModel._();

  const factory DashboardSummaryModel({
    @JsonKey(name: 'shop_name') @Default('') String shopName,
    @JsonKey(name: 'today_sales') @Default(0) double todaySales,
    @JsonKey(name: 'sales_growth_percent') @Default(0) double salesGrowthPercent,
    @JsonKey(name: 'low_stock_count') @Default(0) int lowStockCount,
    @JsonKey(name: 'pending_ledger_amount') @Default(0) double pendingLedgerAmount,
    @JsonKey(name: 'pending_ledger_accounts_count')
    @Default(0)
    int pendingLedgerAccountsCount,
    @JsonKey(name: 'recent_transactions')
    @Default([])
    List<DashboardRecentTransactionModel> recentTransactions,
    @JsonKey(name: 'top_selling_products')
    @Default([])
    List<DashboardTopProductModel> topSellingProducts,
  }) = _DashboardSummaryModel;

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryModelFromJson(json);

  DashboardSummaryEntity toEntity() => DashboardSummaryEntity(
        shopName: shopName,
        todaySales: todaySales,
        salesGrowthPercent: salesGrowthPercent,
        lowStockCount: lowStockCount,
        pendingLedgerAmount: pendingLedgerAmount,
        pendingLedgerAccountsCount: pendingLedgerAccountsCount,
        recentTransactions:
            recentTransactions.map((e) => e.toEntity()).toList(),
        topSellingProducts: topSellingProducts.map((e) => e.toEntity()).toList(),
      );
}
