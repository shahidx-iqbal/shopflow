import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_top_product_entity.freezed.dart';

/// Top-selling product shown on the dashboard carousel/grid.
@freezed
abstract class DashboardTopProductEntity with _$DashboardTopProductEntity {
  const factory DashboardTopProductEntity({
    required String id,
    required String name,
    required double price,
    String? imageUrl,
    @Default(0) int unitsSold,
  }) = _DashboardTopProductEntity;
}
