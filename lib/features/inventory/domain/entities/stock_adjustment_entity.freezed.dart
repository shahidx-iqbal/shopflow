// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_adjustment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockAdjustmentEntity {

 String get id; String get productId; int get previousStock; int get newStock; String get reason; DateTime get createdAt;
/// Create a copy of StockAdjustmentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockAdjustmentEntityCopyWith<StockAdjustmentEntity> get copyWith => _$StockAdjustmentEntityCopyWithImpl<StockAdjustmentEntity>(this as StockAdjustmentEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockAdjustmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.previousStock, previousStock) || other.previousStock == previousStock)&&(identical(other.newStock, newStock) || other.newStock == newStock)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,productId,previousStock,newStock,reason,createdAt);

@override
String toString() {
  return 'StockAdjustmentEntity(id: $id, productId: $productId, previousStock: $previousStock, newStock: $newStock, reason: $reason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StockAdjustmentEntityCopyWith<$Res>  {
  factory $StockAdjustmentEntityCopyWith(StockAdjustmentEntity value, $Res Function(StockAdjustmentEntity) _then) = _$StockAdjustmentEntityCopyWithImpl;
@useResult
$Res call({
 String id, String productId, int previousStock, int newStock, String reason, DateTime createdAt
});




}
/// @nodoc
class _$StockAdjustmentEntityCopyWithImpl<$Res>
    implements $StockAdjustmentEntityCopyWith<$Res> {
  _$StockAdjustmentEntityCopyWithImpl(this._self, this._then);

  final StockAdjustmentEntity _self;
  final $Res Function(StockAdjustmentEntity) _then;

/// Create a copy of StockAdjustmentEntity
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


/// Adds pattern-matching-related methods to [StockAdjustmentEntity].
extension StockAdjustmentEntityPatterns on StockAdjustmentEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockAdjustmentEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockAdjustmentEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockAdjustmentEntity value)  $default,){
final _that = this;
switch (_that) {
case _StockAdjustmentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockAdjustmentEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StockAdjustmentEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  int previousStock,  int newStock,  String reason,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockAdjustmentEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  int previousStock,  int newStock,  String reason,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StockAdjustmentEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  int previousStock,  int newStock,  String reason,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StockAdjustmentEntity() when $default != null:
return $default(_that.id,_that.productId,_that.previousStock,_that.newStock,_that.reason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _StockAdjustmentEntity implements StockAdjustmentEntity {
  const _StockAdjustmentEntity({required this.id, required this.productId, required this.previousStock, required this.newStock, required this.reason, required this.createdAt});
  

@override final  String id;
@override final  String productId;
@override final  int previousStock;
@override final  int newStock;
@override final  String reason;
@override final  DateTime createdAt;

/// Create a copy of StockAdjustmentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockAdjustmentEntityCopyWith<_StockAdjustmentEntity> get copyWith => __$StockAdjustmentEntityCopyWithImpl<_StockAdjustmentEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockAdjustmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.previousStock, previousStock) || other.previousStock == previousStock)&&(identical(other.newStock, newStock) || other.newStock == newStock)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,productId,previousStock,newStock,reason,createdAt);

@override
String toString() {
  return 'StockAdjustmentEntity(id: $id, productId: $productId, previousStock: $previousStock, newStock: $newStock, reason: $reason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StockAdjustmentEntityCopyWith<$Res> implements $StockAdjustmentEntityCopyWith<$Res> {
  factory _$StockAdjustmentEntityCopyWith(_StockAdjustmentEntity value, $Res Function(_StockAdjustmentEntity) _then) = __$StockAdjustmentEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, int previousStock, int newStock, String reason, DateTime createdAt
});




}
/// @nodoc
class __$StockAdjustmentEntityCopyWithImpl<$Res>
    implements _$StockAdjustmentEntityCopyWith<$Res> {
  __$StockAdjustmentEntityCopyWithImpl(this._self, this._then);

  final _StockAdjustmentEntity _self;
  final $Res Function(_StockAdjustmentEntity) _then;

/// Create a copy of StockAdjustmentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? previousStock = null,Object? newStock = null,Object? reason = null,Object? createdAt = null,}) {
  return _then(_StockAdjustmentEntity(
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
