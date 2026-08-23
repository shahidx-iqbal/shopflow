// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleModel {

 String get id;@JsonKey(name: 'invoice_number', includeToJson: false) String? get invoiceNumber; List<CartItemModel> get items;@JsonKey(name: 'sale_type') SaleType get saleType; CustomerModel? get customer;@JsonKey(name: 'payment_status') PaymentStatus get paymentStatus;@JsonKey(name: 'status') String get status; double get subtotal; double get discount; double get tax; double get total;@JsonKey(name: 'cash_received') double? get cashReceived;@JsonKey(name: 'amount_paid_now') double? get amountPaidNow;@JsonKey(name: 'added_to_ledger') double? get addedToLedger;@JsonKey(name: 'refund_reason') String? get refundReason;@JsonKey(name: 'refunded_at') DateTime? get refundedAt;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleModelCopyWith<SaleModel> get copyWith => _$SaleModelCopyWithImpl<SaleModel>(this as SaleModel, _$identity);

  /// Serializes this SaleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.cashReceived, cashReceived) || other.cashReceived == cashReceived)&&(identical(other.amountPaidNow, amountPaidNow) || other.amountPaidNow == amountPaidNow)&&(identical(other.addedToLedger, addedToLedger) || other.addedToLedger == addedToLedger)&&(identical(other.refundReason, refundReason) || other.refundReason == refundReason)&&(identical(other.refundedAt, refundedAt) || other.refundedAt == refundedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,const DeepCollectionEquality().hash(items),saleType,customer,paymentStatus,status,subtotal,discount,tax,total,cashReceived,amountPaidNow,addedToLedger,refundReason,refundedAt,createdAt);

@override
String toString() {
  return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, items: $items, saleType: $saleType, customer: $customer, paymentStatus: $paymentStatus, status: $status, subtotal: $subtotal, discount: $discount, tax: $tax, total: $total, cashReceived: $cashReceived, amountPaidNow: $amountPaidNow, addedToLedger: $addedToLedger, refundReason: $refundReason, refundedAt: $refundedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SaleModelCopyWith<$Res>  {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) _then) = _$SaleModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'invoice_number', includeToJson: false) String? invoiceNumber, List<CartItemModel> items,@JsonKey(name: 'sale_type') SaleType saleType, CustomerModel? customer,@JsonKey(name: 'payment_status') PaymentStatus paymentStatus,@JsonKey(name: 'status') String status, double subtotal, double discount, double tax, double total,@JsonKey(name: 'cash_received') double? cashReceived,@JsonKey(name: 'amount_paid_now') double? amountPaidNow,@JsonKey(name: 'added_to_ledger') double? addedToLedger,@JsonKey(name: 'refund_reason') String? refundReason,@JsonKey(name: 'refunded_at') DateTime? refundedAt,@JsonKey(name: 'created_at') DateTime createdAt
});


$CustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class _$SaleModelCopyWithImpl<$Res>
    implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._self, this._then);

  final SaleModel _self;
  final $Res Function(SaleModel) _then;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = freezed,Object? items = null,Object? saleType = null,Object? customer = freezed,Object? paymentStatus = null,Object? status = null,Object? subtotal = null,Object? discount = null,Object? tax = null,Object? total = null,Object? cashReceived = freezed,Object? amountPaidNow = freezed,Object? addedToLedger = freezed,Object? refundReason = freezed,Object? refundedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as SaleType,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
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
/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerModelCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleModel].
extension SaleModelPatterns on SaleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleModel value)  $default,){
final _that = this;
switch (_that) {
case _SaleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleModel value)?  $default,){
final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'invoice_number', includeToJson: false)  String? invoiceNumber,  List<CartItemModel> items, @JsonKey(name: 'sale_type')  SaleType saleType,  CustomerModel? customer, @JsonKey(name: 'payment_status')  PaymentStatus paymentStatus, @JsonKey(name: 'status')  String status,  double subtotal,  double discount,  double tax,  double total, @JsonKey(name: 'cash_received')  double? cashReceived, @JsonKey(name: 'amount_paid_now')  double? amountPaidNow, @JsonKey(name: 'added_to_ledger')  double? addedToLedger, @JsonKey(name: 'refund_reason')  String? refundReason, @JsonKey(name: 'refunded_at')  DateTime? refundedAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'invoice_number', includeToJson: false)  String? invoiceNumber,  List<CartItemModel> items, @JsonKey(name: 'sale_type')  SaleType saleType,  CustomerModel? customer, @JsonKey(name: 'payment_status')  PaymentStatus paymentStatus, @JsonKey(name: 'status')  String status,  double subtotal,  double discount,  double tax,  double total, @JsonKey(name: 'cash_received')  double? cashReceived, @JsonKey(name: 'amount_paid_now')  double? amountPaidNow, @JsonKey(name: 'added_to_ledger')  double? addedToLedger, @JsonKey(name: 'refund_reason')  String? refundReason, @JsonKey(name: 'refunded_at')  DateTime? refundedAt, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SaleModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'invoice_number', includeToJson: false)  String? invoiceNumber,  List<CartItemModel> items, @JsonKey(name: 'sale_type')  SaleType saleType,  CustomerModel? customer, @JsonKey(name: 'payment_status')  PaymentStatus paymentStatus, @JsonKey(name: 'status')  String status,  double subtotal,  double discount,  double tax,  double total, @JsonKey(name: 'cash_received')  double? cashReceived, @JsonKey(name: 'amount_paid_now')  double? amountPaidNow, @JsonKey(name: 'added_to_ledger')  double? addedToLedger, @JsonKey(name: 'refund_reason')  String? refundReason, @JsonKey(name: 'refunded_at')  DateTime? refundedAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.items,_that.saleType,_that.customer,_that.paymentStatus,_that.status,_that.subtotal,_that.discount,_that.tax,_that.total,_that.cashReceived,_that.amountPaidNow,_that.addedToLedger,_that.refundReason,_that.refundedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _SaleModel extends SaleModel {
  const _SaleModel({this.id = '', @JsonKey(name: 'invoice_number', includeToJson: false) this.invoiceNumber, required final  List<CartItemModel> items, @JsonKey(name: 'sale_type') required this.saleType, this.customer, @JsonKey(name: 'payment_status') required this.paymentStatus, @JsonKey(name: 'status') this.status = 'completed', this.subtotal = 0, this.discount = 0, this.tax = 0, required this.total, @JsonKey(name: 'cash_received') this.cashReceived, @JsonKey(name: 'amount_paid_now') this.amountPaidNow, @JsonKey(name: 'added_to_ledger') this.addedToLedger, @JsonKey(name: 'refund_reason') this.refundReason, @JsonKey(name: 'refunded_at') this.refundedAt, @JsonKey(name: 'created_at') required this.createdAt}): _items = items,super._();
  factory _SaleModel.fromJson(Map<String, dynamic> json) => _$SaleModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey(name: 'invoice_number', includeToJson: false) final  String? invoiceNumber;
 final  List<CartItemModel> _items;
@override List<CartItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'sale_type') final  SaleType saleType;
@override final  CustomerModel? customer;
@override@JsonKey(name: 'payment_status') final  PaymentStatus paymentStatus;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey() final  double subtotal;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double tax;
@override final  double total;
@override@JsonKey(name: 'cash_received') final  double? cashReceived;
@override@JsonKey(name: 'amount_paid_now') final  double? amountPaidNow;
@override@JsonKey(name: 'added_to_ledger') final  double? addedToLedger;
@override@JsonKey(name: 'refund_reason') final  String? refundReason;
@override@JsonKey(name: 'refunded_at') final  DateTime? refundedAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleModelCopyWith<_SaleModel> get copyWith => __$SaleModelCopyWithImpl<_SaleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.cashReceived, cashReceived) || other.cashReceived == cashReceived)&&(identical(other.amountPaidNow, amountPaidNow) || other.amountPaidNow == amountPaidNow)&&(identical(other.addedToLedger, addedToLedger) || other.addedToLedger == addedToLedger)&&(identical(other.refundReason, refundReason) || other.refundReason == refundReason)&&(identical(other.refundedAt, refundedAt) || other.refundedAt == refundedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,const DeepCollectionEquality().hash(_items),saleType,customer,paymentStatus,status,subtotal,discount,tax,total,cashReceived,amountPaidNow,addedToLedger,refundReason,refundedAt,createdAt);

@override
String toString() {
  return 'SaleModel(id: $id, invoiceNumber: $invoiceNumber, items: $items, saleType: $saleType, customer: $customer, paymentStatus: $paymentStatus, status: $status, subtotal: $subtotal, discount: $discount, tax: $tax, total: $total, cashReceived: $cashReceived, amountPaidNow: $amountPaidNow, addedToLedger: $addedToLedger, refundReason: $refundReason, refundedAt: $refundedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SaleModelCopyWith<$Res> implements $SaleModelCopyWith<$Res> {
  factory _$SaleModelCopyWith(_SaleModel value, $Res Function(_SaleModel) _then) = __$SaleModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'invoice_number', includeToJson: false) String? invoiceNumber, List<CartItemModel> items,@JsonKey(name: 'sale_type') SaleType saleType, CustomerModel? customer,@JsonKey(name: 'payment_status') PaymentStatus paymentStatus,@JsonKey(name: 'status') String status, double subtotal, double discount, double tax, double total,@JsonKey(name: 'cash_received') double? cashReceived,@JsonKey(name: 'amount_paid_now') double? amountPaidNow,@JsonKey(name: 'added_to_ledger') double? addedToLedger,@JsonKey(name: 'refund_reason') String? refundReason,@JsonKey(name: 'refunded_at') DateTime? refundedAt,@JsonKey(name: 'created_at') DateTime createdAt
});


@override $CustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class __$SaleModelCopyWithImpl<$Res>
    implements _$SaleModelCopyWith<$Res> {
  __$SaleModelCopyWithImpl(this._self, this._then);

  final _SaleModel _self;
  final $Res Function(_SaleModel) _then;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = freezed,Object? items = null,Object? saleType = null,Object? customer = freezed,Object? paymentStatus = null,Object? status = null,Object? subtotal = null,Object? discount = null,Object? tax = null,Object? total = null,Object? cashReceived = freezed,Object? amountPaidNow = freezed,Object? addedToLedger = freezed,Object? refundReason = freezed,Object? refundedAt = freezed,Object? createdAt = null,}) {
  return _then(_SaleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as SaleType,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
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

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerModelCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}

// dart format on
