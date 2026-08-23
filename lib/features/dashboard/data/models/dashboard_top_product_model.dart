import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/dashboard_top_product_entity.dart';

part 'dashboard_top_product_model.freezed.dart';
part 'dashboard_top_product_model.g.dart';

@freezed
abstract class DashboardTopProductModel with _$DashboardTopProductModel {
  const DashboardTopProductModel._();

  const factory DashboardTopProductModel({
    required String id,
    required String name,
    required double price,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'units_sold') @Default(0) int unitsSold,
  }) = _DashboardTopProductModel;

  factory DashboardTopProductModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardTopProductModelFromJson(json);

  DashboardTopProductEntity toEntity() => DashboardTopProductEntity(
        id: id,
        name: name,
        price: price,
        imageUrl: imageUrl,
        unitsSold: unitsSold,
      );
}
