// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaleEntity {

 String get id; String? get invoiceNumber; List<CartItemEntity> get items; SaleType get saleType; CustomerEntity? get customer; PaymentStatus get paymentStatus; SaleStatus get status; double get subtotal; double get discount; double get tax; double get total; double? get cashReceived; double? get amountPaidNow; double? get addedToLedger; String? get refundReason; DateTime? get refundedAt; DateTime get createdAt;
/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleEntityCopyWith<SaleEntity> get copyWith => _$SaleEntityCopyWithImpl<SaleEntity>(this as SaleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.cashReceived, cashReceived) || other.cashReceived == cashReceived)&&(identical(other.amountPaidNow, amountPaidNow) || other.amountPaidNow == amountPaidNow)&&(identical(other.addedToLedger, addedToLedger) || other.addedToLedger == addedToLedger)&&(identical(other.refundReason, refundReason) || other.refundReason == refundReason)&&(identical(other.refundedAt, refundedAt) || other.refundedAt == refundedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,const DeepCollectionEquality().hash(items),saleType,customer,paymentStatus,status,subtotal,discount,tax,total,cashReceived,amountPaidNow,addedToLedger,refundReason,refundedAt,createdAt);

@override
String toString() {
  return 'SaleEntity(id: $id, invoiceNumber: $invoiceNumber, items: $items, saleType: $saleType, customer: $customer, paymentStatus: $paymentStatus, status: $status, subtotal: $subtotal, discount: $discount, tax: $tax, total: $total, cashReceived: $cashReceived, amountPaidNow: $amountPaidNow, addedToLedger: $addedToLedger, refundReason: $refundReason, refundedAt: $refundedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SaleEntityCopyWith<$Res>  {
  factory $SaleEntityCopyWith(SaleEntity value, $Res Function(SaleEntity) _then) = _$SaleEntityCopyWithImpl;
@useResult
$Res call({
 String id, String? invoiceNumber, List<CartItemEntity> items, SaleType saleType, CustomerEntity? customer, PaymentStatus paymentStatus, SaleStatus status, double subtotal, double discount, double tax, double total, double? cashReceived, double? amountPaidNow, double? addedToLedger, String? refundReason, DateTime? refundedAt, DateTime createdAt
});


$CustomerEntityCopyWith<$Res>? get customer;

}
/// @nodoc
class _$SaleEntityCopyWithImpl<$Res>
    implements $SaleEntityCopyWith<$Res> {
  _$SaleEntityCopyWithImpl(this._self, this._then);

  final SaleEntity _self;
  final $Res Function(SaleEntity) _then;

/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = freezed,Object? items = null,Object? saleType = null,Object? customer = freezed,Object? paymentStatus = null,Object? status = null,Object? subtotal = null,Object? discount = null,Object? tax = null,Object? total = null,Object? cashReceived = freezed,Object? amountPaidNow = freezed,Object? addedToLedger = freezed,Object? refundReason = freezed,Object? refundedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemEntity>,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as SaleType,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerEntity?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SaleStatus,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,cashReceived: freezed == cashReceived ? _self.cashReceived : cashReceived // ignore: cast_nullable_to_non_nullable
as double?,amountPaidNow: freezed == amountPaidNow ? _self.amountPaidNow : amountPaidNow // ignore: cast_nullable_to_non_nullable
as double?,addedToLedger: freezed == addedToLedger ? _self.addedToLedger : addedToLedger // ignore: cast_nullable_to_non_nullable
as double?,refundReason: freezed == refundReason ? _self.refundReason : refundReason // ignore: cast_nullable_to_non_nullable
as String?,refundedAt: freezed == refundedAt ? _self.refundedAt : refundedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerEntityCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerEntityCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleEntity].
extension SaleEntityPatterns on SaleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleEntity value)  $default,){
final _that = this;
switch (_that) {
case _SaleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SaleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? invoiceNumber,  List<CartItemEntity> items,  SaleType saleType,  CustomerEntity? customer,  PaymentStatus paymentStatus,  SaleStatus status,  double subtotal,  double discount,  double tax,  double total,  double? cashReceived,  double? amountPaidNow,  double? addedToLedger,  String? refundReason,  DateTime? refundedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleEntity() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.items,_that.saleType,_that.customer,_that.paymentStatus,_that.status,_that.subtotal,_that.discount,_that.tax,_that.total,_that.cashReceived,_that.amountPaidNow,_that.addedToLedger,_that.refundReason,_that.refundedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? invoiceNumber,  List<CartItemEntity> items,  SaleType saleType,  CustomerEntity? customer,  PaymentStatus paymentStatus,  SaleStatus status,  double subtotal,  double discount,  double tax,  double total,  double? cashReceived,  double? amountPaidNow,  double? addedToLedger,  String? refundReason,  DateTime? refundedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SaleEntity():
return $default(_that.id,_that.invoiceNumber,_that.items,_that.saleType,_that.customer,_that.paymentStatus,_that.status,_that.subtotal,_that.discount,_that.tax,_that.total,_that.cashReceived,_that.amountPaidNow,_that.addedToLedger,_that.refundReason,_that.refundedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? invoiceNumber,  List<CartItemEntity> items,  SaleType saleType,  CustomerEntity? customer,  PaymentStatus paymentStatus,  SaleStatus status,  double subtotal,  double discount,  double tax,  double total,  double? cashReceived,  double? amountPaidNow,  double? addedToLedger,  String? refundReason,  DateTime? refundedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SaleEntity() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.items,_that.saleType,_that.customer,_that.paymentStatus,_that.status,_that.subtotal,_that.discount,_that.tax,_that.total,_that.cashReceived,_that.amountPaidNow,_that.addedToLedger,_that.refundReason,_that.refundedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _SaleEntity extends SaleEntity {
  const _SaleEntity({this.id = '', this.invoiceNumber, required final  List<CartItemEntity> items, required this.saleType, this.customer, required this.paymentStatus, this.status = SaleStatus.completed, this.subtotal = 0, this.discount = 0, this.tax = 0, required this.total, this.cashReceived, this.amountPaidNow, this.addedToLedger, this.refundReason, this.refundedAt, required this.createdAt}): _items = items,super._();
  

@override@JsonKey() final  String id;
@override final  String? invoiceNumber;
 final  List<CartItemEntity> _items;
@override List<CartItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  SaleType saleType;
@override final  CustomerEntity? customer;
@override final  PaymentStatus paymentStatus;
@override@JsonKey() final  SaleStatus status;
@override@JsonKey() final  double subtotal;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double tax;
@override final  double total;
@override final  double? cashReceived;
@override final  double? amountPaidNow;
@override final  double? addedToLedger;
@override final  String? refundReason;
@override final  DateTime? refundedAt;
@override final  DateTime createdAt;

/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleEntityCopyWith<_SaleEntity> get copyWith => __$SaleEntityCopyWithImpl<_SaleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.cashReceived, cashReceived) || other.cashReceived == cashReceived)&&(identical(other.amountPaidNow, amountPaidNow) || other.amountPaidNow == amountPaidNow)&&(identical(other.addedToLedger, addedToLedger) || other.addedToLedger == addedToLedger)&&(identical(other.refundReason, refundReason) || other.refundReason == refundReason)&&(identical(other.refundedAt, refundedAt) || other.refundedAt == refundedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,const DeepCollectionEquality().hash(_items),saleType,customer,paymentStatus,status,subtotal,discount,tax,total,cashReceived,amountPaidNow,addedToLedger,refundReason,refundedAt,createdAt);

@override
String toString() {
  return 'SaleEntity(id: $id, invoiceNumber: $invoiceNumber, items: $items, saleType: $saleType, customer: $customer, paymentStatus: $paymentStatus, status: $status, subtotal: $subtotal, discount: $discount, tax: $tax, total: $total, cashReceived: $cashReceived, amountPaidNow: $amountPaidNow, addedToLedger: $addedToLedger, refundReason: $refundReason, refundedAt: $refundedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SaleEntityCopyWith<$Res> implements $SaleEntityCopyWith<$Res> {
  factory _$SaleEntityCopyWith(_SaleEntity value, $Res Function(_SaleEntity) _then) = __$SaleEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? invoiceNumber, List<CartItemEntity> items, SaleType saleType, CustomerEntity? customer, PaymentStatus paymentStatus, SaleStatus status, double subtotal, double discount, double tax, double total, double? cashReceived, double? amountPaidNow, double? addedToLedger, String? refundReason, DateTime? refundedAt, DateTime createdAt
});


@override $CustomerEntityCopyWith<$Res>? get customer;

}
/// @nodoc
class __$SaleEntityCopyWithImpl<$Res>
    implements _$SaleEntityCopyWith<$Res> {
  __$SaleEntityCopyWithImpl(this._self, this._then);

  final _SaleEntity _self;
  final $Res Function(_SaleEntity) _then;

/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = freezed,Object? items = null,Object? saleType = null,Object? customer = freezed,Object? paymentStatus = null,Object? status = null,Object? subtotal = null,Object? discount = null,Object? tax = null,Object? total = null,Object? cashReceived = freezed,Object? amountPaidNow = freezed,Object? addedToLedger = freezed,Object? refundReason = freezed,Object? refundedAt = freezed,Object? createdAt = null,}) {
  return _then(_SaleEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemEntity>,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as SaleType,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerEntity?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SaleStatus,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,cashReceived: freezed == cashReceived ? _self.cashReceived : cashReceived // ignore: cast_nullable_to_non_nullable
as double?,amountPaidNow: freezed == amountPaidNow ? _self.amountPaidNow : amountPaidNow // ignore: cast_nullable_to_non_nullable
as double?,addedToLedger: freezed == addedToLedger ? _self.addedToLedger : addedToLedger // ignore: cast_nullable_to_non_nullable
as double?,refundReason: freezed == refundReason ? _self.refundReason : refundReason // ignore: cast_nullable_to_non_nullable
as String?,refundedAt: freezed == refundedAt ? _self.refundedAt : refundedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of SaleEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerEntityCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerEntityCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}

// dart format on
