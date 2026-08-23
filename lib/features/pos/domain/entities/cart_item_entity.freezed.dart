// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartItemEntity {

 String get productId; String get productName; String get barcode; String get unit; double get unitPrice; double get quantity; double get discount; String? get note;
/// Create a copy of CartItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemEntityCopyWith<CartItemEntity> get copyWith => _$CartItemEntityCopyWithImpl<CartItemEntity>(this as CartItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemEntity&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,productId,productName,barcode,unit,unitPrice,quantity,discount,note);

@override
String toString() {
  return 'CartItemEntity(productId: $productId, productName: $productName, barcode: $barcode, unit: $unit, unitPrice: $unitPrice, quantity: $quantity, discount: $discount, note: $note)';
}


}

/// @nodoc
abstract mixin class $CartItemEntityCopyWith<$Res>  {
  factory $CartItemEntityCopyWith(CartItemEntity value, $Res Function(CartItemEntity) _then) = _$CartItemEntityCopyWithImpl;
@useResult
$Res call({
 String productId, String productName, String barcode, String unit, double unitPrice, double quantity, double discount, String? note
});




}
/// @nodoc
class _$CartItemEntityCopyWithImpl<$Res>
    implements $CartItemEntityCopyWith<$Res> {
  _$CartItemEntityCopyWithImpl(this._self, this._then);

  final CartItemEntity _self;
  final $Res Function(CartItemEntity) _then;

/// Create a copy of CartItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? productName = null,Object? barcode = null,Object? unit = null,Object? unitPrice = null,Object? quantity = null,Object? discount = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartItemEntity].
extension CartItemEntityPatterns on CartItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _CartItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CartItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String productName,  String barcode,  String unit,  double unitPrice,  double quantity,  double discount,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItemEntity() when $default != null:
return $default(_that.productId,_that.productName,_that.barcode,_that.unit,_that.unitPrice,_that.quantity,_that.discount,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String productName,  String barcode,  String unit,  double unitPrice,  double quantity,  double discount,  String? note)  $default,) {final _that = this;
switch (_that) {
case _CartItemEntity():
return $default(_that.productId,_that.productName,_that.barcode,_that.unit,_that.unitPrice,_that.quantity,_that.discount,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String productName,  String barcode,  String unit,  double unitPrice,  double quantity,  double discount,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _CartItemEntity() when $default != null:
return $default(_that.productId,_that.productName,_that.barcode,_that.unit,_that.unitPrice,_that.quantity,_that.discount,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _CartItemEntity extends CartItemEntity {
  const _CartItemEntity({required this.productId, required this.productName, required this.barcode, required this.unit, required this.unitPrice, required this.quantity, this.discount = 0, this.note}): super._();
  

@override final  String productId;
@override final  String productName;
@override final  String barcode;
@override final  String unit;
@override final  double unitPrice;
@override final  double quantity;
@override@JsonKey() final  double discount;
@override final  String? note;

/// Create a copy of CartItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemEntityCopyWith<_CartItemEntity> get copyWith => __$CartItemEntityCopyWithImpl<_CartItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItemEntity&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,productId,productName,barcode,unit,unitPrice,quantity,discount,note);

@override
String toString() {
  return 'CartItemEntity(productId: $productId, productName: $productName, barcode: $barcode, unit: $unit, unitPrice: $unitPrice, quantity: $quantity, discount: $discount, note: $note)';
}


}

/// @nodoc
abstract mixin class _$CartItemEntityCopyWith<$Res> implements $CartItemEntityCopyWith<$Res> {
  factory _$CartItemEntityCopyWith(_CartItemEntity value, $Res Function(_CartItemEntity) _then) = __$CartItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String productId, String productName, String barcode, String unit, double unitPrice, double quantity, double discount, String? note
});




}
/// @nodoc
class __$CartItemEntityCopyWithImpl<$Res>
    implements _$CartItemEntityCopyWith<$Res> {
  __$CartItemEntityCopyWithImpl(this._self, this._then);

  final _CartItemEntity _self;
  final $Res Function(_CartItemEntity) _then;

/// Create a copy of CartItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? productName = null,Object? barcode = null,Object? unit = null,Object? unitPrice = null,Object? quantity = null,Object? discount = null,Object? note = freezed,}) {
  return _then(_CartItemEntity(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
