// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_top_product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardTopProductEntity {

 String get id; String get name; double get price; String? get imageUrl; int get unitsSold;
/// Create a copy of DashboardTopProductEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardTopProductEntityCopyWith<DashboardTopProductEntity> get copyWith => _$DashboardTopProductEntityCopyWithImpl<DashboardTopProductEntity>(this as DashboardTopProductEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardTopProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitsSold, unitsSold) || other.unitsSold == unitsSold));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,imageUrl,unitsSold);

@override
String toString() {
  return 'DashboardTopProductEntity(id: $id, name: $name, price: $price, imageUrl: $imageUrl, unitsSold: $unitsSold)';
}


}

/// @nodoc
abstract mixin class $DashboardTopProductEntityCopyWith<$Res>  {
  factory $DashboardTopProductEntityCopyWith(DashboardTopProductEntity value, $Res Function(DashboardTopProductEntity) _then) = _$DashboardTopProductEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, double price, String? imageUrl, int unitsSold
});




}
/// @nodoc
class _$DashboardTopProductEntityCopyWithImpl<$Res>
    implements $DashboardTopProductEntityCopyWith<$Res> {
  _$DashboardTopProductEntityCopyWithImpl(this._self, this._then);

  final DashboardTopProductEntity _self;
  final $Res Function(DashboardTopProductEntity) _then;

/// Create a copy of DashboardTopProductEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? imageUrl = freezed,Object? unitsSold = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitsSold: null == unitsSold ? _self.unitsSold : unitsSold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardTopProductEntity].
extension DashboardTopProductEntityPatterns on DashboardTopProductEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardTopProductEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardTopProductEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardTopProductEntity value)  $default,){
final _that = this;
switch (_that) {
case _DashboardTopProductEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardTopProductEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardTopProductEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double price,  String? imageUrl,  int unitsSold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardTopProductEntity() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.imageUrl,_that.unitsSold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double price,  String? imageUrl,  int unitsSold)  $default,) {final _that = this;
switch (_that) {
case _DashboardTopProductEntity():
return $default(_that.id,_that.name,_that.price,_that.imageUrl,_that.unitsSold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double price,  String? imageUrl,  int unitsSold)?  $default,) {final _that = this;
switch (_that) {
case _DashboardTopProductEntity() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.imageUrl,_that.unitsSold);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardTopProductEntity implements DashboardTopProductEntity {
  const _DashboardTopProductEntity({required this.id, required this.name, required this.price, this.imageUrl, this.unitsSold = 0});
  

@override final  String id;
@override final  String name;
@override final  double price;
@override final  String? imageUrl;
@override@JsonKey() final  int unitsSold;

/// Create a copy of DashboardTopProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardTopProductEntityCopyWith<_DashboardTopProductEntity> get copyWith => __$DashboardTopProductEntityCopyWithImpl<_DashboardTopProductEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardTopProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitsSold, unitsSold) || other.unitsSold == unitsSold));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,imageUrl,unitsSold);

@override
String toString() {
  return 'DashboardTopProductEntity(id: $id, name: $name, price: $price, imageUrl: $imageUrl, unitsSold: $unitsSold)';
}


}

/// @nodoc
abstract mixin class _$DashboardTopProductEntityCopyWith<$Res> implements $DashboardTopProductEntityCopyWith<$Res> {
  factory _$DashboardTopProductEntityCopyWith(_DashboardTopProductEntity value, $Res Function(_DashboardTopProductEntity) _then) = __$DashboardTopProductEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double price, String? imageUrl, int unitsSold
});




}
/// @nodoc
class __$DashboardTopProductEntityCopyWithImpl<$Res>
    implements _$DashboardTopProductEntityCopyWith<$Res> {
  __$DashboardTopProductEntityCopyWithImpl(this._self, this._then);

  final _DashboardTopProductEntity _self;
  final $Res Function(_DashboardTopProductEntity) _then;

/// Create a copy of DashboardTopProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? imageUrl = freezed,Object? unitsSold = null,}) {
  return _then(_DashboardTopProductEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitsSold: null == unitsSold ? _self.unitsSold : unitsSold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
