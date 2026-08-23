// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_recent_transaction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardRecentTransactionEntity {

 String get id; String get customerName; DateTime get createdAt; int get itemCount; DashboardTransactionStatus get status; String? get paymentMethod; double get amount;
/// Create a copy of DashboardRecentTransactionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardRecentTransactionEntityCopyWith<DashboardRecentTransactionEntity> get copyWith => _$DashboardRecentTransactionEntityCopyWithImpl<DashboardRecentTransactionEntity>(this as DashboardRecentTransactionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardRecentTransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerName,createdAt,itemCount,status,paymentMethod,amount);

@override
String toString() {
  return 'DashboardRecentTransactionEntity(id: $id, customerName: $customerName, createdAt: $createdAt, itemCount: $itemCount, status: $status, paymentMethod: $paymentMethod, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $DashboardRecentTransactionEntityCopyWith<$Res>  {
  factory $DashboardRecentTransactionEntityCopyWith(DashboardRecentTransactionEntity value, $Res Function(DashboardRecentTransactionEntity) _then) = _$DashboardRecentTransactionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String customerName, DateTime createdAt, int itemCount, DashboardTransactionStatus status, String? paymentMethod, double amount
});




}
/// @nodoc
class _$DashboardRecentTransactionEntityCopyWithImpl<$Res>
    implements $DashboardRecentTransactionEntityCopyWith<$Res> {
  _$DashboardRecentTransactionEntityCopyWithImpl(this._self, this._then);

  final DashboardRecentTransactionEntity _self;
  final $Res Function(DashboardRecentTransactionEntity) _then;

/// Create a copy of DashboardRecentTransactionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerName = null,Object? createdAt = null,Object? itemCount = null,Object? status = null,Object? paymentMethod = freezed,Object? amount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DashboardTransactionStatus,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardRecentTransactionEntity].
extension DashboardRecentTransactionEntityPatterns on DashboardRecentTransactionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardRecentTransactionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardRecentTransactionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardRecentTransactionEntity value)  $default,){
final _that = this;
switch (_that) {
case _DashboardRecentTransactionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardRecentTransactionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardRecentTransactionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String customerName,  DateTime createdAt,  int itemCount,  DashboardTransactionStatus status,  String? paymentMethod,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardRecentTransactionEntity() when $default != null:
return $default(_that.id,_that.customerName,_that.createdAt,_that.itemCount,_that.status,_that.paymentMethod,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String customerName,  DateTime createdAt,  int itemCount,  DashboardTransactionStatus status,  String? paymentMethod,  double amount)  $default,) {final _that = this;
switch (_that) {
case _DashboardRecentTransactionEntity():
return $default(_that.id,_that.customerName,_that.createdAt,_that.itemCount,_that.status,_that.paymentMethod,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String customerName,  DateTime createdAt,  int itemCount,  DashboardTransactionStatus status,  String? paymentMethod,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _DashboardRecentTransactionEntity() when $default != null:
return $default(_that.id,_that.customerName,_that.createdAt,_that.itemCount,_that.status,_that.paymentMethod,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardRecentTransactionEntity implements DashboardRecentTransactionEntity {
  const _DashboardRecentTransactionEntity({required this.id, required this.customerName, required this.createdAt, required this.itemCount, required this.status, this.paymentMethod, required this.amount});
  

@override final  String id;
@override final  String customerName;
@override final  DateTime createdAt;
@override final  int itemCount;
@override final  DashboardTransactionStatus status;
@override final  String? paymentMethod;
@override final  double amount;

/// Create a copy of DashboardRecentTransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardRecentTransactionEntityCopyWith<_DashboardRecentTransactionEntity> get copyWith => __$DashboardRecentTransactionEntityCopyWithImpl<_DashboardRecentTransactionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardRecentTransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerName,createdAt,itemCount,status,paymentMethod,amount);

@override
String toString() {
  return 'DashboardRecentTransactionEntity(id: $id, customerName: $customerName, createdAt: $createdAt, itemCount: $itemCount, status: $status, paymentMethod: $paymentMethod, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$DashboardRecentTransactionEntityCopyWith<$Res> implements $DashboardRecentTransactionEntityCopyWith<$Res> {
  factory _$DashboardRecentTransactionEntityCopyWith(_DashboardRecentTransactionEntity value, $Res Function(_DashboardRecentTransactionEntity) _then) = __$DashboardRecentTransactionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String customerName, DateTime createdAt, int itemCount, DashboardTransactionStatus status, String? paymentMethod, double amount
});




}
/// @nodoc
class __$DashboardRecentTransactionEntityCopyWithImpl<$Res>
    implements _$DashboardRecentTransactionEntityCopyWith<$Res> {
  __$DashboardRecentTransactionEntityCopyWithImpl(this._self, this._then);

  final _DashboardRecentTransactionEntity _self;
  final $Res Function(_DashboardRecentTransactionEntity) _then;

/// Create a copy of DashboardRecentTransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerName = null,Object? createdAt = null,Object? itemCount = null,Object? status = null,Object? paymentMethod = freezed,Object? amount = null,}) {
  return _then(_DashboardRecentTransactionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DashboardTransactionStatus,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
