import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

/// JSON-serializable product model mapping to [ProductEntity].
@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required String id,
    required String name,
    required String barcode,
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    required double price,
    @JsonKey(name: 'cost_price') required double costPrice,
    required int stock,
    @JsonKey(name: 'low_stock_threshold') required int lowStockThreshold,
    required String unit,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromEntity(ProductEntity e) => ProductModel(
        id: e.id,
        name: e.name,
        barcode: e.barcode,
        categoryId: e.categoryId,
        categoryName: e.categoryName,
        price: e.price,
        costPrice: e.costPrice,
        stock: e.stock,
        lowStockThreshold: e.lowStockThreshold,
        unit: e.unit,
        imageUrl: e.imageUrl,
        isActive: e.isActive,
        createdAt: e.createdAt,
        updatedAt: e.updatedAt,
      );

  ProductEntity toEntity() => ProductEntity(
        id: id,
        name: name,
        barcode: barcode,
        categoryId: categoryId,
        categoryName: categoryName,
        price: price,
        costPrice: costPrice,
        stock: stock,
        lowStockThreshold: lowStockThreshold,
        unit: unit,
        imageUrl: imageUrl,
        isActive: isActive,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
