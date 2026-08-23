import 'package:freezed_annotation/freezed_annotation.dart';
part 'report_summary_entity.freezed.dart';

@freezed
abstract class TopProductEntity with _$TopProductEntity {
  const factory TopProductEntity({
    required String name,
    String? category,
    required int quantity,
    required double revenue,
  }) = _TopProductEntity;
}

@freezed
abstract class BestCustomerEntity with _$BestCustomerEntity {
  const factory BestCustomerEntity({
    required String id,
    required String name,
    required int visitCount,
    required double totalSpent,
  }) = _BestCustomerEntity;
}

/// Aggregated sales report for a given date range.
@freezed
abstract class ReportSummaryEntity with _$ReportSummaryEntity {
  const factory ReportSummaryEntity({
    required DateTime startDate,
    required DateTime endDate,
    @Default(0) double totalSales,
    @Default(0) double cashSales,
    @Default(0) double ledgerSales,
    @Default(0) double netProfit,
    double? revenueGrowthPercent,
    @Default(0) double ledgerOutstanding,
    @Default(0) int ledgerCustomerCount,
    @Default([]) List<TopProductEntity> topProducts,
    @Default([]) List<BestCustomerEntity> bestCustomers,
  }) = _ReportSummaryEntity;
}
