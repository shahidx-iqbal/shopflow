// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_adjustment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockAdjustmentModel {

 String get id;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'previous_stock') int get previousStock;@JsonKey(name: 'new_stock') int get newStock; String get reason;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of StockAdjustmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockAdjustmentModelCopyWith<StockAdjustmentModel> get copyWith => _$StockAdjustmentModelCopyWithImpl<StockAdjustmentModel>(this as StockAdjustmentModel, _$identity);

  /// Serializes this StockAdjustmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockAdjustmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.previousStock, previousStock) || other.previousStock == previousStock)&&(identical(other.newStock, newStock) || other.newStock == newStock)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,previousStock,newStock,reason,createdAt);

@override
String toString() {
  return 'StockAdjustmentModel(id: $id, productId: $productId, previousStock: $previousStock, newStock: $newStock, reason: $reason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StockAdjustmentModelCopyWith<$Res>  {
  factory $StockAdjustmentModelCopyWith(StockAdjustmentModel value, $Res Function(StockAdjustmentModel) _then) = _$StockAdjustmentModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'previous_stock') int previousStock,@JsonKey(name: 'new_stock') int newStock, String reason,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$StockAdjustmentModelCopyWithImpl<$Res>
    implements $StockAdjustmentModelCopyWith<$Res> {
  _$StockAdjustmentModelCopyWithImpl(this._self, this._then);

  final StockAdjustmentModel _self;
  final $Res Function(StockAdjustmentModel) _then;

/// Create a copy of StockAdjustmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? previousStock = null,Object? newStock = null,Object? reason = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,previousStock: null == previousStock ? _self.previousStock : previousStock // ignore: cast_nullable_to_non_nullable
as int,newStock: null == newStock ? _self.newStock : newStock // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StockAdjustmentModel].
extension StockAdjustmentModelPatterns on StockAdjustmentModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockAdjustmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockAdjustmentModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockAdjustmentModel value)  $default,){
final _that = this;
switch (_that) {
case _StockAdjustmentModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockAdjustmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockAdjustmentModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'previous_stock')  int previousStock, @JsonKey(name: 'new_stock')  int newStock,  String reason, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockAdjustmentModel() when $default != null:
return $default(_that.id,_that.productId,_that.previousStock,_that.newStock,_that.reason,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'previous_stock')  int previousStock, @JsonKey(name: 'new_stock')  int newStock,  String reason, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StockAdjustmentModel():
return $default(_that.id,_that.productId,_that.previousStock,_that.newStock,_that.reason,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'previous_stock')  int previousStock, @JsonKey(name: 'new_stock')  int newStock,  String reason, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StockAdjustmentModel() when $default != null:
return $default(_that.id,_that.productId,_that.previousStock,_that.newStock,_that.reason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockAdjustmentModel extends StockAdjustmentModel {
  const _StockAdjustmentModel({required this.id, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'previous_stock') required this.previousStock, @JsonKey(name: 'new_stock') required this.newStock, required this.reason, @JsonKey(name: 'created_at') required this.createdAt}): super._();
  factory _StockAdjustmentModel.fromJson(Map<String, dynamic> json) => _$StockAdjustmentModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'previous_stock') final  int previousStock;
@override@JsonKey(name: 'new_stock') final  int newStock;
@override final  String reason;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of StockAdjustmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockAdjustmentModelCopyWith<_StockAdjustmentModel> get copyWith => __$StockAdjustmentModelCopyWithImpl<_StockAdjustmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockAdjustmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockAdjustmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.previousStock, previousStock) || other.previousStock == previousStock)&&(identical(other.newStock, newStock) || other.newStock == newStock)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,previousStock,newStock,reason,createdAt);

@override
String toString() {
  return 'StockAdjustmentModel(id: $id, productId: $productId, previousStock: $previousStock, newStock: $newStock, reason: $reason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StockAdjustmentModelCopyWith<$Res> implements $StockAdjustmentModelCopyWith<$Res> {
  factory _$StockAdjustmentModelCopyWith(_StockAdjustmentModel value, $Res Function(_StockAdjustmentModel) _then) = __$StockAdjustmentModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'previous_stock') int previousStock,@JsonKey(name: 'new_stock') int newStock, String reason,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$StockAdjustmentModelCopyWithImpl<$Res>
    implements _$StockAdjustmentModelCopyWith<$Res> {
  __$StockAdjustmentModelCopyWithImpl(this._self, this._then);

  final _StockAdjustmentModel _self;
  final $Res Function(_StockAdjustmentModel) _then;

/// Create a copy of StockAdjustmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? previousStock = null,Object? newStock = null,Object? reason = null,Object? createdAt = null,}) {
  return _then(_StockAdjustmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,previousStock: null == previousStock ? _self.previousStock : previousStock // ignore: cast_nullable_to_non_nullable
as int,newStock: null == newStock ? _self.newStock : newStock // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
