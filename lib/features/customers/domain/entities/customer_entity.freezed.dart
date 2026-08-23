// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerEntity {

 String get id; String get name; String get phone; String? get address; String? get notes; CustomerType get customerType; double get balance; DateTime get createdAt;
/// Create a copy of CustomerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerEntityCopyWith<CustomerEntity> get copyWith => _$CustomerEntityCopyWithImpl<CustomerEntity>(this as CustomerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,notes,customerType,balance,createdAt);

@override
String toString() {
  return 'CustomerEntity(id: $id, name: $name, phone: $phone, address: $address, notes: $notes, customerType: $customerType, balance: $balance, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CustomerEntityCopyWith<$Res>  {
  factory $CustomerEntityCopyWith(CustomerEntity value, $Res Function(CustomerEntity) _then) = _$CustomerEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phone, String? address, String? notes, CustomerType customerType, double balance, DateTime createdAt
});




}
/// @nodoc
class _$CustomerEntityCopyWithImpl<$Res>
    implements $CustomerEntityCopyWith<$Res> {
  _$CustomerEntityCopyWithImpl(this._self, this._then);

  final CustomerEntity _self;
  final $Res Function(CustomerEntity) _then;

/// Create a copy of CustomerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? address = freezed,Object? notes = freezed,Object? customerType = null,Object? balance = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerEntity].
extension CustomerEntityPatterns on CustomerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerEntity value)  $default,){
final _that = this;
switch (_that) {
case _CustomerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String? address,  String? notes,  CustomerType customerType,  double balance,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerEntity() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.notes,_that.customerType,_that.balance,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String? address,  String? notes,  CustomerType customerType,  double balance,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CustomerEntity():
return $default(_that.id,_that.name,_that.phone,_that.address,_that.notes,_that.customerType,_that.balance,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phone,  String? address,  String? notes,  CustomerType customerType,  double balance,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CustomerEntity() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.notes,_that.customerType,_that.balance,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerEntity implements CustomerEntity {
  const _CustomerEntity({required this.id, required this.name, required this.phone, this.address, this.notes, this.customerType = CustomerType.ledger, this.balance = 0, required this.createdAt});
  

@override final  String id;
@override final  String name;
@override final  String phone;
@override final  String? address;
@override final  String? notes;
@override@JsonKey() final  CustomerType customerType;
@override@JsonKey() final  double balance;
@override final  DateTime createdAt;

/// Create a copy of CustomerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerEntityCopyWith<_CustomerEntity> get copyWith => __$CustomerEntityCopyWithImpl<_CustomerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,notes,customerType,balance,createdAt);

@override
String toString() {
  return 'CustomerEntity(id: $id, name: $name, phone: $phone, address: $address, notes: $notes, customerType: $customerType, balance: $balance, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CustomerEntityCopyWith<$Res> implements $CustomerEntityCopyWith<$Res> {
  factory _$CustomerEntityCopyWith(_CustomerEntity value, $Res Function(_CustomerEntity) _then) = __$CustomerEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phone, String? address, String? notes, CustomerType customerType, double balance, DateTime createdAt
});




}
/// @nodoc
class __$CustomerEntityCopyWithImpl<$Res>
    implements _$CustomerEntityCopyWith<$Res> {
  __$CustomerEntityCopyWithImpl(this._self, this._then);

  final _CustomerEntity _self;
  final $Res Function(_CustomerEntity) _then;

/// Create a copy of CustomerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? address = freezed,Object? notes = freezed,Object? customerType = null,Object? balance = null,Object? createdAt = null,}) {
  return _then(_CustomerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
