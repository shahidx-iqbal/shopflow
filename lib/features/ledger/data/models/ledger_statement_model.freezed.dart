// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ledger_statement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LedgerStatementModel {

 CustomerModel get customer; List<LedgerEntryModel> get entries;@JsonKey(name: 'total_debit') double get totalDebit;@JsonKey(name: 'total_credit') double get totalCredit; double get balance;
/// Create a copy of LedgerStatementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerStatementModelCopyWith<LedgerStatementModel> get copyWith => _$LedgerStatementModelCopyWithImpl<LedgerStatementModel>(this as LedgerStatementModel, _$identity);

  /// Serializes this LedgerStatementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerStatementModel&&(identical(other.customer, customer) || other.customer == customer)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.totalDebit, totalDebit) || other.totalDebit == totalDebit)&&(identical(other.totalCredit, totalCredit) || other.totalCredit == totalCredit)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer,const DeepCollectionEquality().hash(entries),totalDebit,totalCredit,balance);

@override
String toString() {
  return 'LedgerStatementModel(customer: $customer, entries: $entries, totalDebit: $totalDebit, totalCredit: $totalCredit, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $LedgerStatementModelCopyWith<$Res>  {
  factory $LedgerStatementModelCopyWith(LedgerStatementModel value, $Res Function(LedgerStatementModel) _then) = _$LedgerStatementModelCopyWithImpl;
@useResult
$Res call({
 CustomerModel customer, List<LedgerEntryModel> entries,@JsonKey(name: 'total_debit') double totalDebit,@JsonKey(name: 'total_credit') double totalCredit, double balance
});


$CustomerModelCopyWith<$Res> get customer;

}
/// @nodoc
class _$LedgerStatementModelCopyWithImpl<$Res>
    implements $LedgerStatementModelCopyWith<$Res> {
  _$LedgerStatementModelCopyWithImpl(this._self, this._then);

  final LedgerStatementModel _self;
  final $Res Function(LedgerStatementModel) _then;

/// Create a copy of LedgerStatementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customer = null,Object? entries = null,Object? totalDebit = null,Object? totalCredit = null,Object? balance = null,}) {
  return _then(_self.copyWith(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<LedgerEntryModel>,totalDebit: null == totalDebit ? _self.totalDebit : totalDebit // ignore: cast_nullable_to_non_nullable
as double,totalCredit: null == totalCredit ? _self.totalCredit : totalCredit // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of LedgerStatementModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res> get customer {
  
  return $CustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [LedgerStatementModel].
extension LedgerStatementModelPatterns on LedgerStatementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerStatementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerStatementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerStatementModel value)  $default,){
final _that = this;
switch (_that) {
case _LedgerStatementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerStatementModel value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerStatementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomerModel customer,  List<LedgerEntryModel> entries, @JsonKey(name: 'total_debit')  double totalDebit, @JsonKey(name: 'total_credit')  double totalCredit,  double balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerStatementModel() when $default != null:
return $default(_that.customer,_that.entries,_that.totalDebit,_that.totalCredit,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomerModel customer,  List<LedgerEntryModel> entries, @JsonKey(name: 'total_debit')  double totalDebit, @JsonKey(name: 'total_credit')  double totalCredit,  double balance)  $default,) {final _that = this;
switch (_that) {
case _LedgerStatementModel():
return $default(_that.customer,_that.entries,_that.totalDebit,_that.totalCredit,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomerModel customer,  List<LedgerEntryModel> entries, @JsonKey(name: 'total_debit')  double totalDebit, @JsonKey(name: 'total_credit')  double totalCredit,  double balance)?  $default,) {final _that = this;
switch (_that) {
case _LedgerStatementModel() when $default != null:
return $default(_that.customer,_that.entries,_that.totalDebit,_that.totalCredit,_that.balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerStatementModel extends LedgerStatementModel {
  const _LedgerStatementModel({required this.customer, required final  List<LedgerEntryModel> entries, @JsonKey(name: 'total_debit') this.totalDebit = 0, @JsonKey(name: 'total_credit') this.totalCredit = 0, this.balance = 0}): _entries = entries,super._();
  factory _LedgerStatementModel.fromJson(Map<String, dynamic> json) => _$LedgerStatementModelFromJson(json);

@override final  CustomerModel customer;
 final  List<LedgerEntryModel> _entries;
@override List<LedgerEntryModel> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey(name: 'total_debit') final  double totalDebit;
@override@JsonKey(name: 'total_credit') final  double totalCredit;
@override@JsonKey() final  double balance;

/// Create a copy of LedgerStatementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerStatementModelCopyWith<_LedgerStatementModel> get copyWith => __$LedgerStatementModelCopyWithImpl<_LedgerStatementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerStatementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerStatementModel&&(identical(other.customer, customer) || other.customer == customer)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.totalDebit, totalDebit) || other.totalDebit == totalDebit)&&(identical(other.totalCredit, totalCredit) || other.totalCredit == totalCredit)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer,const DeepCollectionEquality().hash(_entries),totalDebit,totalCredit,balance);

@override
String toString() {
  return 'LedgerStatementModel(customer: $customer, entries: $entries, totalDebit: $totalDebit, totalCredit: $totalCredit, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$LedgerStatementModelCopyWith<$Res> implements $LedgerStatementModelCopyWith<$Res> {
  factory _$LedgerStatementModelCopyWith(_LedgerStatementModel value, $Res Function(_LedgerStatementModel) _then) = __$LedgerStatementModelCopyWithImpl;
@override @useResult
$Res call({
 CustomerModel customer, List<LedgerEntryModel> entries,@JsonKey(name: 'total_debit') double totalDebit,@JsonKey(name: 'total_credit') double totalCredit, double balance
});


@override $CustomerModelCopyWith<$Res> get customer;

}
/// @nodoc
class __$LedgerStatementModelCopyWithImpl<$Res>
    implements _$LedgerStatementModelCopyWith<$Res> {
  __$LedgerStatementModelCopyWithImpl(this._self, this._then);

  final _LedgerStatementModel _self;
  final $Res Function(_LedgerStatementModel) _then;

/// Create a copy of LedgerStatementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customer = null,Object? entries = null,Object? totalDebit = null,Object? totalCredit = null,Object? balance = null,}) {
  return _then(_LedgerStatementModel(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<LedgerEntryModel>,totalDebit: null == totalDebit ? _self.totalDebit : totalDebit // ignore: cast_nullable_to_non_nullable
as double,totalCredit: null == totalCredit ? _self.totalCredit : totalCredit // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of LedgerStatementModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res> get customer {
  
  return $CustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}

// dart format on
