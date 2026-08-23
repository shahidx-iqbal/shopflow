// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_top_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardTopProductModel {

 String get id; String get name; double get price;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'units_sold') int get unitsSold;
/// Create a copy of DashboardTopProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardTopProductModelCopyWith<DashboardTopProductModel> get copyWith => _$DashboardTopProductModelCopyWithImpl<DashboardTopProductModel>(this as DashboardTopProductModel, _$identity);

  /// Serializes this DashboardTopProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardTopProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitsSold, unitsSold) || other.unitsSold == unitsSold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,imageUrl,unitsSold);

@override
String toString() {
  return 'DashboardTopProductModel(id: $id, name: $name, price: $price, imageUrl: $imageUrl, unitsSold: $unitsSold)';
}


}

/// @nodoc
abstract mixin class $DashboardTopProductModelCopyWith<$Res>  {
  factory $DashboardTopProductModelCopyWith(DashboardTopProductModel value, $Res Function(DashboardTopProductModel) _then) = _$DashboardTopProductModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, double price,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'units_sold') int unitsSold
});




}
/// @nodoc
class _$DashboardTopProductModelCopyWithImpl<$Res>
    implements $DashboardTopProductModelCopyWith<$Res> {
  _$DashboardTopProductModelCopyWithImpl(this._self, this._then);

  final DashboardTopProductModel _self;
  final $Res Function(DashboardTopProductModel) _then;

/// Create a copy of DashboardTopProductModel
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


/// Adds pattern-matching-related methods to [DashboardTopProductModel].
extension DashboardTopProductModelPatterns on DashboardTopProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardTopProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardTopProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardTopProductModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardTopProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardTopProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardTopProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double price, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'units_sold')  int unitsSold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardTopProductModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double price, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'units_sold')  int unitsSold)  $default,) {final _that = this;
switch (_that) {
case _DashboardTopProductModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double price, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'units_sold')  int unitsSold)?  $default,) {final _that = this;
switch (_that) {
case _DashboardTopProductModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.imageUrl,_that.unitsSold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardTopProductModel extends DashboardTopProductModel {
  const _DashboardTopProductModel({required this.id, required this.name, required this.price, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'units_sold') this.unitsSold = 0}): super._();
  factory _DashboardTopProductModel.fromJson(Map<String, dynamic> json) => _$DashboardTopProductModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  double price;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'units_sold') final  int unitsSold;

/// Create a copy of DashboardTopProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardTopProductModelCopyWith<_DashboardTopProductModel> get copyWith => __$DashboardTopProductModelCopyWithImpl<_DashboardTopProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardTopProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardTopProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitsSold, unitsSold) || other.unitsSold == unitsSold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,imageUrl,unitsSold);

@override
String toString() {
  return 'DashboardTopProductModel(id: $id, name: $name, price: $price, imageUrl: $imageUrl, unitsSold: $unitsSold)';
}


}

/// @nodoc
abstract mixin class _$DashboardTopProductModelCopyWith<$Res> implements $DashboardTopProductModelCopyWith<$Res> {
  factory _$DashboardTopProductModelCopyWith(_DashboardTopProductModel value, $Res Function(_DashboardTopProductModel) _then) = __$DashboardTopProductModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double price,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'units_sold') int unitsSold
});




}
/// @nodoc
class __$DashboardTopProductModelCopyWithImpl<$Res>
    implements _$DashboardTopProductModelCopyWith<$Res> {
  __$DashboardTopProductModelCopyWithImpl(this._self, this._then);

  final _DashboardTopProductModel _self;
  final $Res Function(_DashboardTopProductModel) _then;

/// Create a copy of DashboardTopProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? imageUrl = freezed,Object? unitsSold = null,}) {
  return _then(_DashboardTopProductModel(
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
