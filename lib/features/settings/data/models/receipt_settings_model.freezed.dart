// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceiptSettingsModel {

@JsonKey(name: 'show_logo') bool get showLogo;@JsonKey(name: 'show_address') bool get showAddress;@JsonKey(name: 'show_phone') bool get showPhone;@JsonKey(name: 'show_tax_number') bool get showTaxNumber;@JsonKey(name: 'header_note') String get headerNote;@JsonKey(name: 'footer_note') String get footerNote;@JsonKey(name: 'show_item_discount') bool get showItemDiscount;@JsonKey(name: 'show_tax_breakdown') bool get showTaxBreakdown;@JsonKey(name: 'show_cashier_name') bool get showCashierName;@JsonKey(name: 'show_customer_name') bool get showCustomerName;@JsonKey(name: 'show_ledger_balance') bool get showLedgerBalance;@JsonKey(name: 'show_payment_method') bool get showPaymentMethod;@JsonKey(name: 'receipt_number_prefix') String get receiptNumberPrefix;@JsonKey(name: 'number_reset_frequency') String get numberResetFrequency;
/// Create a copy of ReceiptSettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptSettingsModelCopyWith<ReceiptSettingsModel> get copyWith => _$ReceiptSettingsModelCopyWithImpl<ReceiptSettingsModel>(this as ReceiptSettingsModel, _$identity);

  /// Serializes this ReceiptSettingsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptSettingsModel&&(identical(other.showLogo, showLogo) || other.showLogo == showLogo)&&(identical(other.showAddress, showAddress) || other.showAddress == showAddress)&&(identical(other.showPhone, showPhone) || other.showPhone == showPhone)&&(identical(other.showTaxNumber, showTaxNumber) || other.showTaxNumber == showTaxNumber)&&(identical(other.headerNote, headerNote) || other.headerNote == headerNote)&&(identical(other.footerNote, footerNote) || other.footerNote == footerNote)&&(identical(other.showItemDiscount, showItemDiscount) || other.showItemDiscount == showItemDiscount)&&(identical(other.showTaxBreakdown, showTaxBreakdown) || other.showTaxBreakdown == showTaxBreakdown)&&(identical(other.showCashierName, showCashierName) || other.showCashierName == showCashierName)&&(identical(other.showCustomerName, showCustomerName) || other.showCustomerName == showCustomerName)&&(identical(other.showLedgerBalance, showLedgerBalance) || other.showLedgerBalance == showLedgerBalance)&&(identical(other.showPaymentMethod, showPaymentMethod) || other.showPaymentMethod == showPaymentMethod)&&(identical(other.receiptNumberPrefix, receiptNumberPrefix) || other.receiptNumberPrefix == receiptNumberPrefix)&&(identical(other.numberResetFrequency, numberResetFrequency) || other.numberResetFrequency == numberResetFrequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showLogo,showAddress,showPhone,showTaxNumber,headerNote,footerNote,showItemDiscount,showTaxBreakdown,showCashierName,showCustomerName,showLedgerBalance,showPaymentMethod,receiptNumberPrefix,numberResetFrequency);

@override
String toString() {
  return 'ReceiptSettingsModel(showLogo: $showLogo, showAddress: $showAddress, showPhone: $showPhone, showTaxNumber: $showTaxNumber, headerNote: $headerNote, footerNote: $footerNote, showItemDiscount: $showItemDiscount, showTaxBreakdown: $showTaxBreakdown, showCashierName: $showCashierName, showCustomerName: $showCustomerName, showLedgerBalance: $showLedgerBalance, showPaymentMethod: $showPaymentMethod, receiptNumberPrefix: $receiptNumberPrefix, numberResetFrequency: $numberResetFrequency)';
}


}

/// @nodoc
abstract mixin class $ReceiptSettingsModelCopyWith<$Res>  {
  factory $ReceiptSettingsModelCopyWith(ReceiptSettingsModel value, $Res Function(ReceiptSettingsModel) _then) = _$ReceiptSettingsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'show_logo') bool showLogo,@JsonKey(name: 'show_address') bool showAddress,@JsonKey(name: 'show_phone') bool showPhone,@JsonKey(name: 'show_tax_number') bool showTaxNumber,@JsonKey(name: 'header_note') String headerNote,@JsonKey(name: 'footer_note') String footerNote,@JsonKey(name: 'show_item_discount') bool showItemDiscount,@JsonKey(name: 'show_tax_breakdown') bool showTaxBreakdown,@JsonKey(name: 'show_cashier_name') bool showCashierName,@JsonKey(name: 'show_customer_name') bool showCustomerName,@JsonKey(name: 'show_ledger_balance') bool showLedgerBalance,@JsonKey(name: 'show_payment_method') bool showPaymentMethod,@JsonKey(name: 'receipt_number_prefix') String receiptNumberPrefix,@JsonKey(name: 'number_reset_frequency') String numberResetFrequency
});




}
/// @nodoc
class _$ReceiptSettingsModelCopyWithImpl<$Res>
    implements $ReceiptSettingsModelCopyWith<$Res> {
  _$ReceiptSettingsModelCopyWithImpl(this._self, this._then);

  final ReceiptSettingsModel _self;
  final $Res Function(ReceiptSettingsModel) _then;

/// Create a copy of ReceiptSettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showLogo = null,Object? showAddress = null,Object? showPhone = null,Object? showTaxNumber = null,Object? headerNote = null,Object? footerNote = null,Object? showItemDiscount = null,Object? showTaxBreakdown = null,Object? showCashierName = null,Object? showCustomerName = null,Object? showLedgerBalance = null,Object? showPaymentMethod = null,Object? receiptNumberPrefix = null,Object? numberResetFrequency = null,}) {
  return _then(_self.copyWith(
showLogo: null == showLogo ? _self.showLogo : showLogo // ignore: cast_nullable_to_non_nullable
as bool,showAddress: null == showAddress ? _self.showAddress : showAddress // ignore: cast_nullable_to_non_nullable
as bool,showPhone: null == showPhone ? _self.showPhone : showPhone // ignore: cast_nullable_to_non_nullable
as bool,showTaxNumber: null == showTaxNumber ? _self.showTaxNumber : showTaxNumber // ignore: cast_nullable_to_non_nullable
as bool,headerNote: null == headerNote ? _self.headerNote : headerNote // ignore: cast_nullable_to_non_nullable
as String,footerNote: null == footerNote ? _self.footerNote : footerNote // ignore: cast_nullable_to_non_nullable
as String,showItemDiscount: null == showItemDiscount ? _self.showItemDiscount : showItemDiscount // ignore: cast_nullable_to_non_nullable
as bool,showTaxBreakdown: null == showTaxBreakdown ? _self.showTaxBreakdown : showTaxBreakdown // ignore: cast_nullable_to_non_nullable
as bool,showCashierName: null == showCashierName ? _self.showCashierName : showCashierName // ignore: cast_nullable_to_non_nullable
as bool,showCustomerName: null == showCustomerName ? _self.showCustomerName : showCustomerName // ignore: cast_nullable_to_non_nullable
as bool,showLedgerBalance: null == showLedgerBalance ? _self.showLedgerBalance : showLedgerBalance // ignore: cast_nullable_to_non_nullable
as bool,showPaymentMethod: null == showPaymentMethod ? _self.showPaymentMethod : showPaymentMethod // ignore: cast_nullable_to_non_nullable
as bool,receiptNumberPrefix: null == receiptNumberPrefix ? _self.receiptNumberPrefix : receiptNumberPrefix // ignore: cast_nullable_to_non_nullable
as String,numberResetFrequency: null == numberResetFrequency ? _self.numberResetFrequency : numberResetFrequency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiptSettingsModel].
extension ReceiptSettingsModelPatterns on ReceiptSettingsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptSettingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptSettingsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptSettingsModel value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptSettingsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptSettingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptSettingsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'show_logo')  bool showLogo, @JsonKey(name: 'show_address')  bool showAddress, @JsonKey(name: 'show_phone')  bool showPhone, @JsonKey(name: 'show_tax_number')  bool showTaxNumber, @JsonKey(name: 'header_note')  String headerNote, @JsonKey(name: 'footer_note')  String footerNote, @JsonKey(name: 'show_item_discount')  bool showItemDiscount, @JsonKey(name: 'show_tax_breakdown')  bool showTaxBreakdown, @JsonKey(name: 'show_cashier_name')  bool showCashierName, @JsonKey(name: 'show_customer_name')  bool showCustomerName, @JsonKey(name: 'show_ledger_balance')  bool showLedgerBalance, @JsonKey(name: 'show_payment_method')  bool showPaymentMethod, @JsonKey(name: 'receipt_number_prefix')  String receiptNumberPrefix, @JsonKey(name: 'number_reset_frequency')  String numberResetFrequency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptSettingsModel() when $default != null:
return $default(_that.showLogo,_that.showAddress,_that.showPhone,_that.showTaxNumber,_that.headerNote,_that.footerNote,_that.showItemDiscount,_that.showTaxBreakdown,_that.showCashierName,_that.showCustomerName,_that.showLedgerBalance,_that.showPaymentMethod,_that.receiptNumberPrefix,_that.numberResetFrequency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'show_logo')  bool showLogo, @JsonKey(name: 'show_address')  bool showAddress, @JsonKey(name: 'show_phone')  bool showPhone, @JsonKey(name: 'show_tax_number')  bool showTaxNumber, @JsonKey(name: 'header_note')  String headerNote, @JsonKey(name: 'footer_note')  String footerNote, @JsonKey(name: 'show_item_discount')  bool showItemDiscount, @JsonKey(name: 'show_tax_breakdown')  bool showTaxBreakdown, @JsonKey(name: 'show_cashier_name')  bool showCashierName, @JsonKey(name: 'show_customer_name')  bool showCustomerName, @JsonKey(name: 'show_ledger_balance')  bool showLedgerBalance, @JsonKey(name: 'show_payment_method')  bool showPaymentMethod, @JsonKey(name: 'receipt_number_prefix')  String receiptNumberPrefix, @JsonKey(name: 'number_reset_frequency')  String numberResetFrequency)  $default,) {final _that = this;
switch (_that) {
case _ReceiptSettingsModel():
return $default(_that.showLogo,_that.showAddress,_that.showPhone,_that.showTaxNumber,_that.headerNote,_that.footerNote,_that.showItemDiscount,_that.showTaxBreakdown,_that.showCashierName,_that.showCustomerName,_that.showLedgerBalance,_that.showPaymentMethod,_that.receiptNumberPrefix,_that.numberResetFrequency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'show_logo')  bool showLogo, @JsonKey(name: 'show_address')  bool showAddress, @JsonKey(name: 'show_phone')  bool showPhone, @JsonKey(name: 'show_tax_number')  bool showTaxNumber, @JsonKey(name: 'header_note')  String headerNote, @JsonKey(name: 'footer_note')  String footerNote, @JsonKey(name: 'show_item_discount')  bool showItemDiscount, @JsonKey(name: 'show_tax_breakdown')  bool showTaxBreakdown, @JsonKey(name: 'show_cashier_name')  bool showCashierName, @JsonKey(name: 'show_customer_name')  bool showCustomerName, @JsonKey(name: 'show_ledger_balance')  bool showLedgerBalance, @JsonKey(name: 'show_payment_method')  bool showPaymentMethod, @JsonKey(name: 'receipt_number_prefix')  String receiptNumberPrefix, @JsonKey(name: 'number_reset_frequency')  String numberResetFrequency)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptSettingsModel() when $default != null:
return $default(_that.showLogo,_that.showAddress,_that.showPhone,_that.showTaxNumber,_that.headerNote,_that.footerNote,_that.showItemDiscount,_that.showTaxBreakdown,_that.showCashierName,_that.showCustomerName,_that.showLedgerBalance,_that.showPaymentMethod,_that.receiptNumberPrefix,_that.numberResetFrequency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReceiptSettingsModel extends ReceiptSettingsModel {
  const _ReceiptSettingsModel({@JsonKey(name: 'show_logo') this.showLogo = true, @JsonKey(name: 'show_address') this.showAddress = true, @JsonKey(name: 'show_phone') this.showPhone = true, @JsonKey(name: 'show_tax_number') this.showTaxNumber = false, @JsonKey(name: 'header_note') this.headerNote = '', @JsonKey(name: 'footer_note') this.footerNote = '', @JsonKey(name: 'show_item_discount') this.showItemDiscount = true, @JsonKey(name: 'show_tax_breakdown') this.showTaxBreakdown = true, @JsonKey(name: 'show_cashier_name') this.showCashierName = false, @JsonKey(name: 'show_customer_name') this.showCustomerName = true, @JsonKey(name: 'show_ledger_balance') this.showLedgerBalance = true, @JsonKey(name: 'show_payment_method') this.showPaymentMethod = true, @JsonKey(name: 'receipt_number_prefix') this.receiptNumberPrefix = 'INV-', @JsonKey(name: 'number_reset_frequency') this.numberResetFrequency = 'never'}): super._();
  factory _ReceiptSettingsModel.fromJson(Map<String, dynamic> json) => _$ReceiptSettingsModelFromJson(json);

@override@JsonKey(name: 'show_logo') final  bool showLogo;
@override@JsonKey(name: 'show_address') final  bool showAddress;
@override@JsonKey(name: 'show_phone') final  bool showPhone;
@override@JsonKey(name: 'show_tax_number') final  bool showTaxNumber;
@override@JsonKey(name: 'header_note') final  String headerNote;
@override@JsonKey(name: 'footer_note') final  String footerNote;
@override@JsonKey(name: 'show_item_discount') final  bool showItemDiscount;
@override@JsonKey(name: 'show_tax_breakdown') final  bool showTaxBreakdown;
@override@JsonKey(name: 'show_cashier_name') final  bool showCashierName;
@override@JsonKey(name: 'show_customer_name') final  bool showCustomerName;
@override@JsonKey(name: 'show_ledger_balance') final  bool showLedgerBalance;
@override@JsonKey(name: 'show_payment_method') final  bool showPaymentMethod;
@override@JsonKey(name: 'receipt_number_prefix') final  String receiptNumberPrefix;
@override@JsonKey(name: 'number_reset_frequency') final  String numberResetFrequency;

/// Create a copy of ReceiptSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptSettingsModelCopyWith<_ReceiptSettingsModel> get copyWith => __$ReceiptSettingsModelCopyWithImpl<_ReceiptSettingsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptSettingsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptSettingsModel&&(identical(other.showLogo, showLogo) || other.showLogo == showLogo)&&(identical(other.showAddress, showAddress) || other.showAddress == showAddress)&&(identical(other.showPhone, showPhone) || other.showPhone == showPhone)&&(identical(other.showTaxNumber, showTaxNumber) || other.showTaxNumber == showTaxNumber)&&(identical(other.headerNote, headerNote) || other.headerNote == headerNote)&&(identical(other.footerNote, footerNote) || other.footerNote == footerNote)&&(identical(other.showItemDiscount, showItemDiscount) || other.showItemDiscount == showItemDiscount)&&(identical(other.showTaxBreakdown, showTaxBreakdown) || other.showTaxBreakdown == showTaxBreakdown)&&(identical(other.showCashierName, showCashierName) || other.showCashierName == showCashierName)&&(identical(other.showCustomerName, showCustomerName) || other.showCustomerName == showCustomerName)&&(identical(other.showLedgerBalance, showLedgerBalance) || other.showLedgerBalance == showLedgerBalance)&&(identical(other.showPaymentMethod, showPaymentMethod) || other.showPaymentMethod == showPaymentMethod)&&(identical(other.receiptNumberPrefix, receiptNumberPrefix) || other.receiptNumberPrefix == receiptNumberPrefix)&&(identical(other.numberResetFrequency, numberResetFrequency) || other.numberResetFrequency == numberResetFrequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showLogo,showAddress,showPhone,showTaxNumber,headerNote,footerNote,showItemDiscount,showTaxBreakdown,showCashierName,showCustomerName,showLedgerBalance,showPaymentMethod,receiptNumberPrefix,numberResetFrequency);

@override
String toString() {
  return 'ReceiptSettingsModel(showLogo: $showLogo, showAddress: $showAddress, showPhone: $showPhone, showTaxNumber: $showTaxNumber, headerNote: $headerNote, footerNote: $footerNote, showItemDiscount: $showItemDiscount, showTaxBreakdown: $showTaxBreakdown, showCashierName: $showCashierName, showCustomerName: $showCustomerName, showLedgerBalance: $showLedgerBalance, showPaymentMethod: $showPaymentMethod, receiptNumberPrefix: $receiptNumberPrefix, numberResetFrequency: $numberResetFrequency)';
}


}

/// @nodoc
abstract mixin class _$ReceiptSettingsModelCopyWith<$Res> implements $ReceiptSettingsModelCopyWith<$Res> {
  factory _$ReceiptSettingsModelCopyWith(_ReceiptSettingsModel value, $Res Function(_ReceiptSettingsModel) _then) = __$ReceiptSettingsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'show_logo') bool showLogo,@JsonKey(name: 'show_address') bool showAddress,@JsonKey(name: 'show_phone') bool showPhone,@JsonKey(name: 'show_tax_number') bool showTaxNumber,@JsonKey(name: 'header_note') String headerNote,@JsonKey(name: 'footer_note') String footerNote,@JsonKey(name: 'show_item_discount') bool showItemDiscount,@JsonKey(name: 'show_tax_breakdown') bool showTaxBreakdown,@JsonKey(name: 'show_cashier_name') bool showCashierName,@JsonKey(name: 'show_customer_name') bool showCustomerName,@JsonKey(name: 'show_ledger_balance') bool showLedgerBalance,@JsonKey(name: 'show_payment_method') bool showPaymentMethod,@JsonKey(name: 'receipt_number_prefix') String receiptNumberPrefix,@JsonKey(name: 'number_reset_frequency') String numberResetFrequency
});




}
/// @nodoc
class __$ReceiptSettingsModelCopyWithImpl<$Res>
    implements _$ReceiptSettingsModelCopyWith<$Res> {
  __$ReceiptSettingsModelCopyWithImpl(this._self, this._then);

  final _ReceiptSettingsModel _self;
  final $Res Function(_ReceiptSettingsModel) _then;

/// Create a copy of ReceiptSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showLogo = null,Object? showAddress = null,Object? showPhone = null,Object? showTaxNumber = null,Object? headerNote = null,Object? footerNote = null,Object? showItemDiscount = null,Object? showTaxBreakdown = null,Object? showCashierName = null,Object? showCustomerName = null,Object? showLedgerBalance = null,Object? showPaymentMethod = null,Object? receiptNumberPrefix = null,Object? numberResetFrequency = null,}) {
  return _then(_ReceiptSettingsModel(
showLogo: null == showLogo ? _self.showLogo : showLogo // ignore: cast_nullable_to_non_nullable
as bool,showAddress: null == showAddress ? _self.showAddress : showAddress // ignore: cast_nullable_to_non_nullable
as bool,showPhone: null == showPhone ? _self.showPhone : showPhone // ignore: cast_nullable_to_non_nullable
as bool,showTaxNumber: null == showTaxNumber ? _self.showTaxNumber : showTaxNumber // ignore: cast_nullable_to_non_nullable
as bool,headerNote: null == headerNote ? _self.headerNote : headerNote // ignore: cast_nullable_to_non_nullable
as String,footerNote: null == footerNote ? _self.footerNote : footerNote // ignore: cast_nullable_to_non_nullable
as String,showItemDiscount: null == showItemDiscount ? _self.showItemDiscount : showItemDiscount // ignore: cast_nullable_to_non_nullable
as bool,showTaxBreakdown: null == showTaxBreakdown ? _self.showTaxBreakdown : showTaxBreakdown // ignore: cast_nullable_to_non_nullable
as bool,showCashierName: null == showCashierName ? _self.showCashierName : showCashierName // ignore: cast_nullable_to_non_nullable
as bool,showCustomerName: null == showCustomerName ? _self.showCustomerName : showCustomerName // ignore: cast_nullable_to_non_nullable
as bool,showLedgerBalance: null == showLedgerBalance ? _self.showLedgerBalance : showLedgerBalance // ignore: cast_nullable_to_non_nullable
as bool,showPaymentMethod: null == showPaymentMethod ? _self.showPaymentMethod : showPaymentMethod // ignore: cast_nullable_to_non_nullable
as bool,receiptNumberPrefix: null == receiptNumberPrefix ? _self.receiptNumberPrefix : receiptNumberPrefix // ignore: cast_nullable_to_non_nullable
as String,numberResetFrequency: null == numberResetFrequency ? _self.numberResetFrequency : numberResetFrequency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
