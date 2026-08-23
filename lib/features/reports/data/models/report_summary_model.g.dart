// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopProductModel _$TopProductModelFromJson(Map<String, dynamic> json) =>
    _TopProductModel(
      name: json['name'] as String,
      category: json['category'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$TopProductModelToJson(_TopProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'quantity': instance.quantity,
      'revenue': instance.revenue,
    };

_BestCustomerModel _$BestCustomerModelFromJson(Map<String, dynamic> json) =>
    _BestCustomerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      visitCount: (json['visit_count'] as num).toInt(),
      totalSpent: (json['total_spent'] as num).toDouble(),
    );

Map<String, dynamic> _$BestCustomerModelToJson(_BestCustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'visit_count': instance.visitCount,
      'total_spent': instance.totalSpent,
    };

_ReportSummaryModel _$ReportSummaryModelFromJson(
  Map<String, dynamic> json,
) => _ReportSummaryModel(
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  totalSales: (json['total_sales'] as num?)?.toDouble() ?? 0,
  cashSales: (json['cash_sales'] as num?)?.toDouble() ?? 0,
  ledgerSales: (json['ledger_sales'] as num?)?.toDouble() ?? 0,
  netProfit: (json['net_profit'] as num?)?.toDouble() ?? 0,
  revenueGrowthPercent: (json['revenue_growth_percent'] as num?)?.toDouble(),
  ledgerOutstanding: (json['ledger_outstanding'] as num?)?.toDouble() ?? 0,
  ledgerCustomerCount: (json['ledger_customer_count'] as num?)?.toInt() ?? 0,
  topProducts:
      (json['top_products'] as List<dynamic>?)
          ?.map((e) => TopProductModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  bestCustomers:
      (json['best_customers'] as List<dynamic>?)
          ?.map((e) => BestCustomerModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ReportSummaryModelToJson(_ReportSummaryModel instance) =>
    <String, dynamic>{
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'total_sales': instance.totalSales,
      'cash_sales': instance.cashSales,
      'ledger_sales': instance.ledgerSales,
      'net_profit': instance.netProfit,
      'revenue_growth_percent': instance.revenueGrowthPercent,
      'ledger_outstanding': instance.ledgerOutstanding,
      'ledger_customer_count': instance.ledgerCustomerCount,
      'top_products': instance.topProducts,
      'best_customers': instance.bestCustomers,
    };
