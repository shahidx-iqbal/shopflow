// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardSummaryModel _$DashboardSummaryModelFromJson(
  Map<String, dynamic> json,
) => _DashboardSummaryModel(
  shopName: json['shop_name'] as String? ?? '',
  todaySales: (json['today_sales'] as num?)?.toDouble() ?? 0,
  salesGrowthPercent: (json['sales_growth_percent'] as num?)?.toDouble() ?? 0,
  lowStockCount: (json['low_stock_count'] as num?)?.toInt() ?? 0,
  pendingLedgerAmount: (json['pending_ledger_amount'] as num?)?.toDouble() ?? 0,
  pendingLedgerAccountsCount:
      (json['pending_ledger_accounts_count'] as num?)?.toInt() ?? 0,
  recentTransactions:
      (json['recent_transactions'] as List<dynamic>?)
          ?.map(
            (e) => DashboardRecentTransactionModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  topSellingProducts:
      (json['top_selling_products'] as List<dynamic>?)
          ?.map(
            (e) => DashboardTopProductModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$DashboardSummaryModelToJson(
  _DashboardSummaryModel instance,
) => <String, dynamic>{
  'shop_name': instance.shopName,
  'today_sales': instance.todaySales,
  'sales_growth_percent': instance.salesGrowthPercent,
  'low_stock_count': instance.lowStockCount,
  'pending_ledger_amount': instance.pendingLedgerAmount,
  'pending_ledger_accounts_count': instance.pendingLedgerAccountsCount,
  'recent_transactions': instance.recentTransactions,
  'top_selling_products': instance.topSellingProducts,
};
