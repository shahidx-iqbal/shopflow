import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

/// Product category — name and icon only.
@freezed
abstract class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String id,
    required String name,
    required String icon,
  }) = _CategoryEntity;
}
