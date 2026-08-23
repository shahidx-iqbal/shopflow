// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_cart_draft_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PosCartDraftModel {

 List<CartItemModel> get items;@JsonKey(name: 'sale_type') SaleType get saleType; CustomerModel? get customer;@JsonKey(name: 'is_partial_payment') bool get isPartialPayment;@JsonKey(name: 'cash_received') double get cashReceived;@JsonKey(name: 'cart_discount') double get cartDiscount;@JsonKey(name: 'tax_enabled') bool get taxEnabled;@JsonKey(name: 'tax_rate') double get taxRate;
/// Create a copy of PosCartDraftModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosCartDraftModelCopyWith<PosCartDraftModel> get copyWith => _$PosCartDraftModelCopyWithImpl<PosCartDraftModel>(this as PosCartDraftModel, _$identity);

  /// Serializes this PosCartDraftModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosCartDraftModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.isPartialPayment, isPartialPayment) || other.isPartialPayment == isPartialPayment)&&(identical(other.cashReceived, cashReceived) || other.cashReceived == cashReceived)&&(identical(other.cartDiscount, cartDiscount) || other.cartDiscount == cartDiscount)&&(identical(other.taxEnabled, taxEnabled) || other.taxEnabled == taxEnabled)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),saleType,customer,isPartialPayment,cashReceived,cartDiscount,taxEnabled,taxRate);

@override
String toString() {
  return 'PosCartDraftModel(items: $items, saleType: $saleType, customer: $customer, isPartialPayment: $isPartialPayment, cashReceived: $cashReceived, cartDiscount: $cartDiscount, taxEnabled: $taxEnabled, taxRate: $taxRate)';
}


}

/// @nodoc
abstract mixin class $PosCartDraftModelCopyWith<$Res>  {
  factory $PosCartDraftModelCopyWith(PosCartDraftModel value, $Res Function(PosCartDraftModel) _then) = _$PosCartDraftModelCopyWithImpl;
@useResult
$Res call({
 List<CartItemModel> items,@JsonKey(name: 'sale_type') SaleType saleType, CustomerModel? customer,@JsonKey(name: 'is_partial_payment') bool isPartialPayment,@JsonKey(name: 'cash_received') double cashReceived,@JsonKey(name: 'cart_discount') double cartDiscount,@JsonKey(name: 'tax_enabled') bool taxEnabled,@JsonKey(name: 'tax_rate') double taxRate
});


$CustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class _$PosCartDraftModelCopyWithImpl<$Res>
    implements $PosCartDraftModelCopyWith<$Res> {
  _$PosCartDraftModelCopyWithImpl(this._self, this._then);

  final PosCartDraftModel _self;
  final $Res Function(PosCartDraftModel) _then;

/// Create a copy of PosCartDraftModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? saleType = null,Object? customer = freezed,Object? isPartialPayment = null,Object? cashReceived = null,Object? cartDiscount = null,Object? taxEnabled = null,Object? taxRate = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as SaleType,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,isPartialPayment: null == isPartialPayment ? _self.isPartialPayment : isPartialPayment // ignore: cast_nullable_to_non_nullable
as bool,cashReceived: null == cashReceived ? _self.cashReceived : cashReceived // ignore: cast_nullable_to_non_nullable
as double,cartDiscount: null == cartDiscount ? _self.cartDiscount : cartDiscount // ignore: cast_nullable_to_non_nullable
as double,taxEnabled: null == taxEnabled ? _self.taxEnabled : taxEnabled // ignore: cast_nullable_to_non_nullable
as bool,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of PosCartDraftModel
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


/// Adds pattern-matching-related methods to [PosCartDraftModel].
extension PosCartDraftModelPatterns on PosCartDraftModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PosCartDraftModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosCartDraftModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PosCartDraftModel value)  $default,){
final _that = this;
switch (_that) {
case _PosCartDraftModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PosCartDraftModel value)?  $default,){
final _that = this;
switch (_that) {
case _PosCartDraftModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartItemModel> items, @JsonKey(name: 'sale_type')  SaleType saleType,  CustomerModel? customer, @JsonKey(name: 'is_partial_payment')  bool isPartialPayment, @JsonKey(name: 'cash_received')  double cashReceived, @JsonKey(name: 'cart_discount')  double cartDiscount, @JsonKey(name: 'tax_enabled')  bool taxEnabled, @JsonKey(name: 'tax_rate')  double taxRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosCartDraftModel() when $default != null:
return $default(_that.items,_that.saleType,_that.customer,_that.isPartialPayment,_that.cashReceived,_that.cartDiscount,_that.taxEnabled,_that.taxRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartItemModel> items, @JsonKey(name: 'sale_type')  SaleType saleType,  CustomerModel? customer, @JsonKey(name: 'is_partial_payment')  bool isPartialPayment, @JsonKey(name: 'cash_received')  double cashReceived, @JsonKey(name: 'cart_discount')  double cartDiscount, @JsonKey(name: 'tax_enabled')  bool taxEnabled, @JsonKey(name: 'tax_rate')  double taxRate)  $default,) {final _that = this;
switch (_that) {
case _PosCartDraftModel():
return $default(_that.items,_that.saleType,_that.customer,_that.isPartialPayment,_that.cashReceived,_that.cartDiscount,_that.taxEnabled,_that.taxRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartItemModel> items, @JsonKey(name: 'sale_type')  SaleType saleType,  CustomerModel? customer, @JsonKey(name: 'is_partial_payment')  bool isPartialPayment, @JsonKey(name: 'cash_received')  double cashReceived, @JsonKey(name: 'cart_discount')  double cartDiscount, @JsonKey(name: 'tax_enabled')  bool taxEnabled, @JsonKey(name: 'tax_rate')  double taxRate)?  $default,) {final _that = this;
switch (_that) {
case _PosCartDraftModel() when $default != null:
return $default(_that.items,_that.saleType,_that.customer,_that.isPartialPayment,_that.cashReceived,_that.cartDiscount,_that.taxEnabled,_that.taxRate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PosCartDraftModel implements PosCartDraftModel {
  const _PosCartDraftModel({final  List<CartItemModel> items = const [], @JsonKey(name: 'sale_type') this.saleType = SaleType.cash, this.customer, @JsonKey(name: 'is_partial_payment') this.isPartialPayment = false, @JsonKey(name: 'cash_received') this.cashReceived = 0, @JsonKey(name: 'cart_discount') this.cartDiscount = 0, @JsonKey(name: 'tax_enabled') this.taxEnabled = false, @JsonKey(name: 'tax_rate') this.taxRate = 0}): _items = items;
  factory _PosCartDraftModel.fromJson(Map<String, dynamic> json) => _$PosCartDraftModelFromJson(json);

 final  List<CartItemModel> _items;
@override@JsonKey() List<CartItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'sale_type') final  SaleType saleType;
@override final  CustomerModel? customer;
@override@JsonKey(name: 'is_partial_payment') final  bool isPartialPayment;
@override@JsonKey(name: 'cash_received') final  double cashReceived;
@override@JsonKey(name: 'cart_discount') final  double cartDiscount;
@override@JsonKey(name: 'tax_enabled') final  bool taxEnabled;
@override@JsonKey(name: 'tax_rate') final  double taxRate;

/// Create a copy of PosCartDraftModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PosCartDraftModelCopyWith<_PosCartDraftModel> get copyWith => __$PosCartDraftModelCopyWithImpl<_PosCartDraftModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PosCartDraftModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosCartDraftModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.isPartialPayment, isPartialPayment) || other.isPartialPayment == isPartialPayment)&&(identical(other.cashReceived, cashReceived) || other.cashReceived == cashReceived)&&(identical(other.cartDiscount, cartDiscount) || other.cartDiscount == cartDiscount)&&(identical(other.taxEnabled, taxEnabled) || other.taxEnabled == taxEnabled)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),saleType,customer,isPartialPayment,cashReceived,cartDiscount,taxEnabled,taxRate);

@override
String toString() {
  return 'PosCartDraftModel(items: $items, saleType: $saleType, customer: $customer, isPartialPayment: $isPartialPayment, cashReceived: $cashReceived, cartDiscount: $cartDiscount, taxEnabled: $taxEnabled, taxRate: $taxRate)';
}


}

/// @nodoc
abstract mixin class _$PosCartDraftModelCopyWith<$Res> implements $PosCartDraftModelCopyWith<$Res> {
  factory _$PosCartDraftModelCopyWith(_PosCartDraftModel value, $Res Function(_PosCartDraftModel) _then) = __$PosCartDraftModelCopyWithImpl;
@override @useResult
$Res call({
 List<CartItemModel> items,@JsonKey(name: 'sale_type') SaleType saleType, CustomerModel? customer,@JsonKey(name: 'is_partial_payment') bool isPartialPayment,@JsonKey(name: 'cash_received') double cashReceived,@JsonKey(name: 'cart_discount') double cartDiscount,@JsonKey(name: 'tax_enabled') bool taxEnabled,@JsonKey(name: 'tax_rate') double taxRate
});


@override $CustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class __$PosCartDraftModelCopyWithImpl<$Res>
    implements _$PosCartDraftModelCopyWith<$Res> {
  __$PosCartDraftModelCopyWithImpl(this._self, this._then);

  final _PosCartDraftModel _self;
  final $Res Function(_PosCartDraftModel) _then;

/// Create a copy of PosCartDraftModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? saleType = null,Object? customer = freezed,Object? isPartialPayment = null,Object? cashReceived = null,Object? cartDiscount = null,Object? taxEnabled = null,Object? taxRate = null,}) {
  return _then(_PosCartDraftModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as SaleType,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,isPartialPayment: null == isPartialPayment ? _self.isPartialPayment : isPartialPayment // ignore: cast_nullable_to_non_nullable
as bool,cashReceived: null == cashReceived ? _self.cashReceived : cashReceived // ignore: cast_nullable_to_non_nullable
as double,cartDiscount: null == cartDiscount ? _self.cartDiscount : cartDiscount // ignore: cast_nullable_to_non_nullable
as double,taxEnabled: null == taxEnabled ? _self.taxEnabled : taxEnabled // ignore: cast_nullable_to_non_nullable
as bool,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of PosCartDraftModel
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
