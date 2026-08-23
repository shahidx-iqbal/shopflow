// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettingsModel {

@JsonKey(name: 'shop_name') String get shopName; String get currency; String get locale;@JsonKey(name: 'low_stock_alert') int get lowStockAlert;@JsonKey(name: 'receipt_footer') String? get receiptFooter;
/// Create a copy of AppSettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsModelCopyWith<AppSettingsModel> get copyWith => _$AppSettingsModelCopyWithImpl<AppSettingsModel>(this as AppSettingsModel, _$identity);

  /// Serializes this AppSettingsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsModel&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.lowStockAlert, lowStockAlert) || other.lowStockAlert == lowStockAlert)&&(identical(other.receiptFooter, receiptFooter) || other.receiptFooter == receiptFooter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopName,currency,locale,lowStockAlert,receiptFooter);

@override
String toString() {
  return 'AppSettingsModel(shopName: $shopName, currency: $currency, locale: $locale, lowStockAlert: $lowStockAlert, receiptFooter: $receiptFooter)';
}


}

/// @nodoc
abstract mixin class $AppSettingsModelCopyWith<$Res>  {
  factory $AppSettingsModelCopyWith(AppSettingsModel value, $Res Function(AppSettingsModel) _then) = _$AppSettingsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shop_name') String shopName, String currency, String locale,@JsonKey(name: 'low_stock_alert') int lowStockAlert,@JsonKey(name: 'receipt_footer') String? receiptFooter
});




}
/// @nodoc
class _$AppSettingsModelCopyWithImpl<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  _$AppSettingsModelCopyWithImpl(this._self, this._then);

  final AppSettingsModel _self;
  final $Res Function(AppSettingsModel) _then;

/// Create a copy of AppSettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shopName = null,Object? currency = null,Object? locale = null,Object? lowStockAlert = null,Object? receiptFooter = freezed,}) {
  return _then(_self.copyWith(
shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,lowStockAlert: null == lowStockAlert ? _self.lowStockAlert : lowStockAlert // ignore: cast_nullable_to_non_nullable
as int,receiptFooter: freezed == receiptFooter ? _self.receiptFooter : receiptFooter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingsModel].
extension AppSettingsModelPatterns on AppSettingsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingsModel value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'shop_name')  String shopName,  String currency,  String locale, @JsonKey(name: 'low_stock_alert')  int lowStockAlert, @JsonKey(name: 'receipt_footer')  String? receiptFooter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingsModel() when $default != null:
return $default(_that.shopName,_that.currency,_that.locale,_that.lowStockAlert,_that.receiptFooter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'shop_name')  String shopName,  String currency,  String locale, @JsonKey(name: 'low_stock_alert')  int lowStockAlert, @JsonKey(name: 'receipt_footer')  String? receiptFooter)  $default,) {final _that = this;
switch (_that) {
case _AppSettingsModel():
return $default(_that.shopName,_that.currency,_that.locale,_that.lowStockAlert,_that.receiptFooter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'shop_name')  String shopName,  String currency,  String locale, @JsonKey(name: 'low_stock_alert')  int lowStockAlert, @JsonKey(name: 'receipt_footer')  String? receiptFooter)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingsModel() when $default != null:
return $default(_that.shopName,_that.currency,_that.locale,_that.lowStockAlert,_that.receiptFooter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettingsModel extends AppSettingsModel {
  const _AppSettingsModel({@JsonKey(name: 'shop_name') required this.shopName, this.currency = 'PKR', this.locale = 'en', @JsonKey(name: 'low_stock_alert') this.lowStockAlert = 5, @JsonKey(name: 'receipt_footer') this.receiptFooter}): super._();
  factory _AppSettingsModel.fromJson(Map<String, dynamic> json) => _$AppSettingsModelFromJson(json);

@override@JsonKey(name: 'shop_name') final  String shopName;
@override@JsonKey() final  String currency;
@override@JsonKey() final  String locale;
@override@JsonKey(name: 'low_stock_alert') final  int lowStockAlert;
@override@JsonKey(name: 'receipt_footer') final  String? receiptFooter;

/// Create a copy of AppSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsModelCopyWith<_AppSettingsModel> get copyWith => __$AppSettingsModelCopyWithImpl<_AppSettingsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingsModel&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.lowStockAlert, lowStockAlert) || other.lowStockAlert == lowStockAlert)&&(identical(other.receiptFooter, receiptFooter) || other.receiptFooter == receiptFooter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopName,currency,locale,lowStockAlert,receiptFooter);

@override
String toString() {
  return 'AppSettingsModel(shopName: $shopName, currency: $currency, locale: $locale, lowStockAlert: $lowStockAlert, receiptFooter: $receiptFooter)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsModelCopyWith<$Res> implements $AppSettingsModelCopyWith<$Res> {
  factory _$AppSettingsModelCopyWith(_AppSettingsModel value, $Res Function(_AppSettingsModel) _then) = __$AppSettingsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shop_name') String shopName, String currency, String locale,@JsonKey(name: 'low_stock_alert') int lowStockAlert,@JsonKey(name: 'receipt_footer') String? receiptFooter
});




}
/// @nodoc
class __$AppSettingsModelCopyWithImpl<$Res>
    implements _$AppSettingsModelCopyWith<$Res> {
  __$AppSettingsModelCopyWithImpl(this._self, this._then);

  final _AppSettingsModel _self;
  final $Res Function(_AppSettingsModel) _then;

/// Create a copy of AppSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shopName = null,Object? currency = null,Object? locale = null,Object? lowStockAlert = null,Object? receiptFooter = freezed,}) {
  return _then(_AppSettingsModel(
shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,lowStockAlert: null == lowStockAlert ? _self.lowStockAlert : lowStockAlert // ignore: cast_nullable_to_non_nullable
as int,receiptFooter: freezed == receiptFooter ? _self.receiptFooter : receiptFooter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
