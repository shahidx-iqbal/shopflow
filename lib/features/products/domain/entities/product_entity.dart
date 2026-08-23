import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

/// Product sold in the shop.
@freezed
abstract class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String id,
    required String name,
    required String barcode,
    required String categoryId,
    String? categoryName,
    required double price,
    required double costPrice,
    required int stock,
    required int lowStockThreshold,
    required String unit,
    String? imageUrl,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProductEntity;
}
