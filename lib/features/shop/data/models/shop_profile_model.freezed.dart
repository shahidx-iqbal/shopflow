// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShopProfileModel {

@JsonKey(name: 'shop_name') String get shopName;@JsonKey(name: 'owner_name') String get ownerName; String get phone; String? get email; String? get address;@JsonKey(name: 'tax_number') String? get taxNumber;@JsonKey(name: 'logo_path') String? get logoPath;
/// Create a copy of ShopProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopProfileModelCopyWith<ShopProfileModel> get copyWith => _$ShopProfileModelCopyWithImpl<ShopProfileModel>(this as ShopProfileModel, _$identity);

  /// Serializes this ShopProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopProfileModel&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopName,ownerName,phone,email,address,taxNumber,logoPath);

@override
String toString() {
  return 'ShopProfileModel(shopName: $shopName, ownerName: $ownerName, phone: $phone, email: $email, address: $address, taxNumber: $taxNumber, logoPath: $logoPath)';
}


}

/// @nodoc
abstract mixin class $ShopProfileModelCopyWith<$Res>  {
  factory $ShopProfileModelCopyWith(ShopProfileModel value, $Res Function(ShopProfileModel) _then) = _$ShopProfileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shop_name') String shopName,@JsonKey(name: 'owner_name') String ownerName, String phone, String? email, String? address,@JsonKey(name: 'tax_number') String? taxNumber,@JsonKey(name: 'logo_path') String? logoPath
});




}
/// @nodoc
class _$ShopProfileModelCopyWithImpl<$Res>
    implements $ShopProfileModelCopyWith<$Res> {
  _$ShopProfileModelCopyWithImpl(this._self, this._then);

  final ShopProfileModel _self;
  final $Res Function(ShopProfileModel) _then;

/// Create a copy of ShopProfileModel
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


/// Adds pattern-matching-related methods to [ShopProfileModel].
extension ShopProfileModelPatterns on ShopProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ShopProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShopProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'shop_name')  String shopName, @JsonKey(name: 'owner_name')  String ownerName,  String phone,  String? email,  String? address, @JsonKey(name: 'tax_number')  String? taxNumber, @JsonKey(name: 'logo_path')  String? logoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopProfileModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'shop_name')  String shopName, @JsonKey(name: 'owner_name')  String ownerName,  String phone,  String? email,  String? address, @JsonKey(name: 'tax_number')  String? taxNumber, @JsonKey(name: 'logo_path')  String? logoPath)  $default,) {final _that = this;
switch (_that) {
case _ShopProfileModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'shop_name')  String shopName, @JsonKey(name: 'owner_name')  String ownerName,  String phone,  String? email,  String? address, @JsonKey(name: 'tax_number')  String? taxNumber, @JsonKey(name: 'logo_path')  String? logoPath)?  $default,) {final _that = this;
switch (_that) {
case _ShopProfileModel() when $default != null:
return $default(_that.shopName,_that.ownerName,_that.phone,_that.email,_that.address,_that.taxNumber,_that.logoPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShopProfileModel extends ShopProfileModel {
  const _ShopProfileModel({@JsonKey(name: 'shop_name') required this.shopName, @JsonKey(name: 'owner_name') required this.ownerName, required this.phone, this.email, this.address, @JsonKey(name: 'tax_number') this.taxNumber, @JsonKey(name: 'logo_path') this.logoPath}): super._();
  factory _ShopProfileModel.fromJson(Map<String, dynamic> json) => _$ShopProfileModelFromJson(json);

@override@JsonKey(name: 'shop_name') final  String shopName;
@override@JsonKey(name: 'owner_name') final  String ownerName;
@override final  String phone;
@override final  String? email;
@override final  String? address;
@override@JsonKey(name: 'tax_number') final  String? taxNumber;
@override@JsonKey(name: 'logo_path') final  String? logoPath;

/// Create a copy of ShopProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopProfileModelCopyWith<_ShopProfileModel> get copyWith => __$ShopProfileModelCopyWithImpl<_ShopProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShopProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopProfileModel&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopName,ownerName,phone,email,address,taxNumber,logoPath);

@override
String toString() {
  return 'ShopProfileModel(shopName: $shopName, ownerName: $ownerName, phone: $phone, email: $email, address: $address, taxNumber: $taxNumber, logoPath: $logoPath)';
}


}

/// @nodoc
abstract mixin class _$ShopProfileModelCopyWith<$Res> implements $ShopProfileModelCopyWith<$Res> {
  factory _$ShopProfileModelCopyWith(_ShopProfileModel value, $Res Function(_ShopProfileModel) _then) = __$ShopProfileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shop_name') String shopName,@JsonKey(name: 'owner_name') String ownerName, String phone, String? email, String? address,@JsonKey(name: 'tax_number') String? taxNumber,@JsonKey(name: 'logo_path') String? logoPath
});




}
/// @nodoc
class __$ShopProfileModelCopyWithImpl<$Res>
    implements _$ShopProfileModelCopyWith<$Res> {
  __$ShopProfileModelCopyWithImpl(this._self, this._then);

  final _ShopProfileModel _self;
  final $Res Function(_ShopProfileModel) _then;

/// Create a copy of ShopProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shopName = null,Object? ownerName = null,Object? phone = null,Object? email = freezed,Object? address = freezed,Object? taxNumber = freezed,Object? logoPath = freezed,}) {
  return _then(_ShopProfileModel(
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
