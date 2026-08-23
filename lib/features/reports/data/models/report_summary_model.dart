import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/report_summary_entity.dart';
part 'report_summary_model.freezed.dart';
part 'report_summary_model.g.dart';

@freezed
abstract class TopProductModel with _$TopProductModel {
  const TopProductModel._();
  const factory TopProductModel({
    required String name,
    String? category,
    required int quantity,
    required double revenue,
  }) = _TopProductModel;
  factory TopProductModel.fromJson(Map<String, dynamic> json) =>
      _$TopProductModelFromJson(json);
  TopProductEntity toEntity() => TopProductEntity(
        name: name,
        category: category,
        quantity: quantity,
        revenue: revenue,
      );
}

@freezed
abstract class BestCustomerModel with _$BestCustomerModel {
  const BestCustomerModel._();
  const factory BestCustomerModel({
    required String id,
    required String name,
    @JsonKey(name: 'visit_count') required int visitCount,
    @JsonKey(name: 'total_spent') required double totalSpent,
  }) = _BestCustomerModel;
  factory BestCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$BestCustomerModelFromJson(json);
  BestCustomerEntity toEntity() => BestCustomerEntity(
        id: id,
        name: name,
        visitCount: visitCount,
        totalSpent: totalSpent,
      );
}

@freezed
abstract class ReportSummaryModel with _$ReportSummaryModel {
  const ReportSummaryModel._();
  const factory ReportSummaryModel({
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    @JsonKey(name: 'total_sales') @Default(0) double totalSales,
    @JsonKey(name: 'cash_sales') @Default(0) double cashSales,
    @JsonKey(name: 'ledger_sales') @Default(0) double ledgerSales,
    @JsonKey(name: 'net_profit') @Default(0) double netProfit,
    @JsonKey(name: 'revenue_growth_percent') double? revenueGrowthPercent,
    @JsonKey(name: 'ledger_outstanding') @Default(0) double ledgerOutstanding,
    @JsonKey(name: 'ledger_customer_count') @Default(0) int ledgerCustomerCount,
    @JsonKey(name: 'top_products') @Default([]) List<TopProductModel> topProducts,
    @JsonKey(name: 'best_customers') @Default([]) List<BestCustomerModel> bestCustomers,
  }) = _ReportSummaryModel;
  factory ReportSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ReportSummaryModelFromJson(json);
  ReportSummaryEntity toEntity() => ReportSummaryEntity(
        startDate: startDate,
        endDate: endDate,
        totalSales: totalSales,
        cashSales: cashSales,
        ledgerSales: ledgerSales,
        netProfit: netProfit,
        revenueGrowthPercent: revenueGrowthPercent,
        ledgerOutstanding: ledgerOutstanding,
        ledgerCustomerCount: ledgerCustomerCount,
        topProducts: topProducts.map((e) => e.toEntity()).toList(),
        bestCustomers: bestCustomers.map((e) => e.toEntity()).toList(),
      );
}
