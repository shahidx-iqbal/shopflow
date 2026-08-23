import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    required String id,
    required String name,
    required String icon,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.fromEntity(CategoryEntity e) => CategoryModel(
        id: e.id,
        name: e.name,
        icon: e.icon,
      );

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
        icon: icon,
      );
}
