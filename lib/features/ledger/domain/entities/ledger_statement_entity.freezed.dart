// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ledger_statement_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LedgerStatementEntity {

 CustomerEntity get customer; List<LedgerEntryEntity> get entries; double get totalDebit; double get totalCredit; double get balance;
/// Create a copy of LedgerStatementEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerStatementEntityCopyWith<LedgerStatementEntity> get copyWith => _$LedgerStatementEntityCopyWithImpl<LedgerStatementEntity>(this as LedgerStatementEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerStatementEntity&&(identical(other.customer, customer) || other.customer == customer)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.totalDebit, totalDebit) || other.totalDebit == totalDebit)&&(identical(other.totalCredit, totalCredit) || other.totalCredit == totalCredit)&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode => Object.hash(runtimeType,customer,const DeepCollectionEquality().hash(entries),totalDebit,totalCredit,balance);

@override
String toString() {
  return 'LedgerStatementEntity(customer: $customer, entries: $entries, totalDebit: $totalDebit, totalCredit: $totalCredit, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $LedgerStatementEntityCopyWith<$Res>  {
  factory $LedgerStatementEntityCopyWith(LedgerStatementEntity value, $Res Function(LedgerStatementEntity) _then) = _$LedgerStatementEntityCopyWithImpl;
@useResult
$Res call({
 CustomerEntity customer, List<LedgerEntryEntity> entries, double totalDebit, double totalCredit, double balance
});


$CustomerEntityCopyWith<$Res> get customer;

}
/// @nodoc
class _$LedgerStatementEntityCopyWithImpl<$Res>
    implements $LedgerStatementEntityCopyWith<$Res> {
  _$LedgerStatementEntityCopyWithImpl(this._self, this._then);

  final LedgerStatementEntity _self;
  final $Res Function(LedgerStatementEntity) _then;

/// Create a copy of LedgerStatementEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customer = null,Object? entries = null,Object? totalDebit = null,Object? totalCredit = null,Object? balance = null,}) {
  return _then(_self.copyWith(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerEntity,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<LedgerEntryEntity>,totalDebit: null == totalDebit ? _self.totalDebit : totalDebit // ignore: cast_nullable_to_non_nullable
as double,totalCredit: null == totalCredit ? _self.totalCredit : totalCredit // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of LedgerStatementEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerEntityCopyWith<$Res> get customer {
  
  return $CustomerEntityCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [LedgerStatementEntity].
extension LedgerStatementEntityPatterns on LedgerStatementEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerStatementEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerStatementEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerStatementEntity value)  $default,){
final _that = this;
switch (_that) {
case _LedgerStatementEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerStatementEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerStatementEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomerEntity customer,  List<LedgerEntryEntity> entries,  double totalDebit,  double totalCredit,  double balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerStatementEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomerEntity customer,  List<LedgerEntryEntity> entries,  double totalDebit,  double totalCredit,  double balance)  $default,) {final _that = this;
switch (_that) {
case _LedgerStatementEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomerEntity customer,  List<LedgerEntryEntity> entries,  double totalDebit,  double totalCredit,  double balance)?  $default,) {final _that = this;
switch (_that) {
case _LedgerStatementEntity() when $default != null:
return $default(_that.customer,_that.entries,_that.totalDebit,_that.totalCredit,_that.balance);case _:
  return null;

}
}

}

/// @nodoc


class _LedgerStatementEntity implements LedgerStatementEntity {
  const _LedgerStatementEntity({required this.customer, required final  List<LedgerEntryEntity> entries, this.totalDebit = 0, this.totalCredit = 0, this.balance = 0}): _entries = entries;
  

@override final  CustomerEntity customer;
 final  List<LedgerEntryEntity> _entries;
@override List<LedgerEntryEntity> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  double totalDebit;
@override@JsonKey() final  double totalCredit;
@override@JsonKey() final  double balance;

/// Create a copy of LedgerStatementEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerStatementEntityCopyWith<_LedgerStatementEntity> get copyWith => __$LedgerStatementEntityCopyWithImpl<_LedgerStatementEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerStatementEntity&&(identical(other.customer, customer) || other.customer == customer)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.totalDebit, totalDebit) || other.totalDebit == totalDebit)&&(identical(other.totalCredit, totalCredit) || other.totalCredit == totalCredit)&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode => Object.hash(runtimeType,customer,const DeepCollectionEquality().hash(_entries),totalDebit,totalCredit,balance);

@override
String toString() {
  return 'LedgerStatementEntity(customer: $customer, entries: $entries, totalDebit: $totalDebit, totalCredit: $totalCredit, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$LedgerStatementEntityCopyWith<$Res> implements $LedgerStatementEntityCopyWith<$Res> {
  factory _$LedgerStatementEntityCopyWith(_LedgerStatementEntity value, $Res Function(_LedgerStatementEntity) _then) = __$LedgerStatementEntityCopyWithImpl;
@override @useResult
$Res call({
 CustomerEntity customer, List<LedgerEntryEntity> entries, double totalDebit, double totalCredit, double balance
});


@override $CustomerEntityCopyWith<$Res> get customer;

}
/// @nodoc
class __$LedgerStatementEntityCopyWithImpl<$Res>
    implements _$LedgerStatementEntityCopyWith<$Res> {
  __$LedgerStatementEntityCopyWithImpl(this._self, this._then);

  final _LedgerStatementEntity _self;
  final $Res Function(_LedgerStatementEntity) _then;

/// Create a copy of LedgerStatementEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customer = null,Object? entries = null,Object? totalDebit = null,Object? totalCredit = null,Object? balance = null,}) {
  return _then(_LedgerStatementEntity(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerEntity,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<LedgerEntryEntity>,totalDebit: null == totalDebit ? _self.totalDebit : totalDebit // ignore: cast_nullable_to_non_nullable
as double,totalCredit: null == totalCredit ? _self.totalCredit : totalCredit // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of LedgerStatementEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerEntityCopyWith<$Res> get customer {
  
  return $CustomerEntityCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}

// dart format on
