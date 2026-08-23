// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_recent_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardRecentTransactionModel {

 String get id;@JsonKey(name: 'customer_name') String get customerName;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'item_count') int get itemCount; DashboardTransactionStatus get status;@JsonKey(name: 'payment_method') String? get paymentMethod; double get amount;
/// Create a copy of DashboardRecentTransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardRecentTransactionModelCopyWith<DashboardRecentTransactionModel> get copyWith => _$DashboardRecentTransactionModelCopyWithImpl<DashboardRecentTransactionModel>(this as DashboardRecentTransactionModel, _$identity);

  /// Serializes this DashboardRecentTransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardRecentTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerName,createdAt,itemCount,status,paymentMethod,amount);

@override
String toString() {
  return 'DashboardRecentTransactionModel(id: $id, customerName: $customerName, createdAt: $createdAt, itemCount: $itemCount, status: $status, paymentMethod: $paymentMethod, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $DashboardRecentTransactionModelCopyWith<$Res>  {
  factory $DashboardRecentTransactionModelCopyWith(DashboardRecentTransactionModel value, $Res Function(DashboardRecentTransactionModel) _then) = _$DashboardRecentTransactionModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'customer_name') String customerName,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'item_count') int itemCount, DashboardTransactionStatus status,@JsonKey(name: 'payment_method') String? paymentMethod, double amount
});




}
/// @nodoc
class _$DashboardRecentTransactionModelCopyWithImpl<$Res>
    implements $DashboardRecentTransactionModelCopyWith<$Res> {
  _$DashboardRecentTransactionModelCopyWithImpl(this._self, this._then);

  final DashboardRecentTransactionModel _self;
  final $Res Function(DashboardRecentTransactionModel) _then;

/// Create a copy of DashboardRecentTransactionModel
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


/// Adds pattern-matching-related methods to [DashboardRecentTransactionModel].
extension DashboardRecentTransactionModelPatterns on DashboardRecentTransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardRecentTransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardRecentTransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardRecentTransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardRecentTransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardRecentTransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardRecentTransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'item_count')  int itemCount,  DashboardTransactionStatus status, @JsonKey(name: 'payment_method')  String? paymentMethod,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardRecentTransactionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'item_count')  int itemCount,  DashboardTransactionStatus status, @JsonKey(name: 'payment_method')  String? paymentMethod,  double amount)  $default,) {final _that = this;
switch (_that) {
case _DashboardRecentTransactionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'item_count')  int itemCount,  DashboardTransactionStatus status, @JsonKey(name: 'payment_method')  String? paymentMethod,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _DashboardRecentTransactionModel() when $default != null:
return $default(_that.id,_that.customerName,_that.createdAt,_that.itemCount,_that.status,_that.paymentMethod,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardRecentTransactionModel extends DashboardRecentTransactionModel {
  const _DashboardRecentTransactionModel({required this.id, @JsonKey(name: 'customer_name') required this.customerName, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'item_count') required this.itemCount, required this.status, @JsonKey(name: 'payment_method') this.paymentMethod, required this.amount}): super._();
  factory _DashboardRecentTransactionModel.fromJson(Map<String, dynamic> json) => _$DashboardRecentTransactionModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'customer_name') final  String customerName;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'item_count') final  int itemCount;
@override final  DashboardTransactionStatus status;
@override@JsonKey(name: 'payment_method') final  String? paymentMethod;
@override final  double amount;

/// Create a copy of DashboardRecentTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardRecentTransactionModelCopyWith<_DashboardRecentTransactionModel> get copyWith => __$DashboardRecentTransactionModelCopyWithImpl<_DashboardRecentTransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardRecentTransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardRecentTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerName,createdAt,itemCount,status,paymentMethod,amount);

@override
String toString() {
  return 'DashboardRecentTransactionModel(id: $id, customerName: $customerName, createdAt: $createdAt, itemCount: $itemCount, status: $status, paymentMethod: $paymentMethod, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$DashboardRecentTransactionModelCopyWith<$Res> implements $DashboardRecentTransactionModelCopyWith<$Res> {
  factory _$DashboardRecentTransactionModelCopyWith(_DashboardRecentTransactionModel value, $Res Function(_DashboardRecentTransactionModel) _then) = __$DashboardRecentTransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'customer_name') String customerName,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'item_count') int itemCount, DashboardTransactionStatus status,@JsonKey(name: 'payment_method') String? paymentMethod, double amount
});




}
/// @nodoc
class __$DashboardRecentTransactionModelCopyWithImpl<$Res>
    implements _$DashboardRecentTransactionModelCopyWith<$Res> {
  __$DashboardRecentTransactionModelCopyWithImpl(this._self, this._then);

  final _DashboardRecentTransactionModel _self;
  final $Res Function(_DashboardRecentTransactionModel) _then;

/// Create a copy of DashboardRecentTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerName = null,Object? createdAt = null,Object? itemCount = null,Object? status = null,Object? paymentMethod = freezed,Object? amount = null,}) {
  return _then(_DashboardRecentTransactionModel(
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
