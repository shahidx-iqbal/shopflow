// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShopProfileEntity {

 String get shopName; String get ownerName; String get phone; String? get email; String? get address; String? get taxNumber; String? get logoPath;
/// Create a copy of ShopProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopProfileEntityCopyWith<ShopProfileEntity> get copyWith => _$ShopProfileEntityCopyWithImpl<ShopProfileEntity>(this as ShopProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopProfileEntity&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath));
}


@override
int get hashCode => Object.hash(runtimeType,shopName,ownerName,phone,email,address,taxNumber,logoPath);

@override
String toString() {
  return 'ShopProfileEntity(shopName: $shopName, ownerName: $ownerName, phone: $phone, email: $email, address: $address, taxNumber: $taxNumber, logoPath: $logoPath)';
}


}

/// @nodoc
abstract mixin class $ShopProfileEntityCopyWith<$Res>  {
  factory $ShopProfileEntityCopyWith(ShopProfileEntity value, $Res Function(ShopProfileEntity) _then) = _$ShopProfileEntityCopyWithImpl;
@useResult
$Res call({
 String shopName, String ownerName, String phone, String? email, String? address, String? taxNumber, String? logoPath
});




}
/// @nodoc
class _$ShopProfileEntityCopyWithImpl<$Res>
    implements $ShopProfileEntityCopyWith<$Res> {
  _$ShopProfileEntityCopyWithImpl(this._self, this._then);

  final ShopProfileEntity _self;
  final $Res Function(ShopProfileEntity) _then;

/// Create a copy of ShopProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shopName = null,Object? ownerName = null,Object? phone = null,Object? email = freezed,Object? address = freezed,Object? taxNumber = freezed,Object? logoPath = freezed,}) {
  return _then(_self.copyWith(
shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,taxNumber: freezed == taxNumber ? _self.taxNumber : taxNumber // ignore: cast_nullable_to_non_nullable
as String?,logoPath: freezed == logoPath ? _self.logoPath : logoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopProfileEntity].
extension ShopProfileEntityPatterns on ShopProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _ShopProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ShopProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String shopName,  String ownerName,  String phone,  String? email,  String? address,  String? taxNumber,  String? logoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopProfileEntity() when $default != null:
return $default(_that.shopName,_that.ownerName,_that.phone,_that.email,_that.address,_that.taxNumber,_that.logoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String shopName,  String ownerName,  String phone,  String? email,  String? address,  String? taxNumber,  String? logoPath)  $default,) {final _that = this;
switch (_that) {
case _ShopProfileEntity():
return $default(_that.shopName,_that.ownerName,_that.phone,_that.email,_that.address,_that.taxNumber,_that.logoPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String shopName,  String ownerName,  String phone,  String? email,  String? address,  String? taxNumber,  String? logoPath)?  $default,) {final _that = this;
switch (_that) {
case _ShopProfileEntity() when $default != null:
return $default(_that.shopName,_that.ownerName,_that.phone,_that.email,_that.address,_that.taxNumber,_that.logoPath);case _:
  return null;

}
}

}

/// @nodoc


class _ShopProfileEntity implements ShopProfileEntity {
  const _ShopProfileEntity({required this.shopName, required this.ownerName, required this.phone, this.email, this.address, this.taxNumber, this.logoPath});
  

@override final  String shopName;
@override final  String ownerName;
@override final  String phone;
@override final  String? email;
@override final  String? address;
@override final  String? taxNumber;
@override final  String? logoPath;

/// Create a copy of ShopProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopProfileEntityCopyWith<_ShopProfileEntity> get copyWith => __$ShopProfileEntityCopyWithImpl<_ShopProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopProfileEntity&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath));
}


@override
int get hashCode => Object.hash(runtimeType,shopName,ownerName,phone,email,address,taxNumber,logoPath);

@override
String toString() {
  return 'ShopProfileEntity(shopName: $shopName, ownerName: $ownerName, phone: $phone, email: $email, address: $address, taxNumber: $taxNumber, logoPath: $logoPath)';
}


}

/// @nodoc
abstract mixin class _$ShopProfileEntityCopyWith<$Res> implements $ShopProfileEntityCopyWith<$Res> {
  factory _$ShopProfileEntityCopyWith(_ShopProfileEntity value, $Res Function(_ShopProfileEntity) _then) = __$ShopProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String shopName, String ownerName, String phone, String? email, String? address, String? taxNumber, String? logoPath
});




}
/// @nodoc
class __$ShopProfileEntityCopyWithImpl<$Res>
    implements _$ShopProfileEntityCopyWith<$Res> {
  __$ShopProfileEntityCopyWithImpl(this._self, this._then);

  final _ShopProfileEntity _self;
  final $Res Function(_ShopProfileEntity) _then;

/// Create a copy of ShopProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shopName = null,Object? ownerName = null,Object? phone = null,Object? email = freezed,Object? address = freezed,Object? taxNumber = freezed,Object? logoPath = freezed,}) {
  return _then(_ShopProfileEntity(
shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,ownerName: null == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,taxNumber: freezed == taxNumber ? _self.taxNumber : taxNumber // ignore: cast_nullable_to_non_nullable
as String?,logoPath: freezed == logoPath ? _self.logoPath : logoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
