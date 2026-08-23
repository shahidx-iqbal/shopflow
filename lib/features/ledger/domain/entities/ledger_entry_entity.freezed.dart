// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ledger_entry_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LedgerEntryEntity {

 String get id; String get customerId; String? get saleId; double get amount; LedgerEntryType get type; String? get notes; DateTime get createdAt;
/// Create a copy of LedgerEntryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerEntryEntityCopyWith<LedgerEntryEntity> get copyWith => _$LedgerEntryEntityCopyWithImpl<LedgerEntryEntity>(this as LedgerEntryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerEntryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.saleId, saleId) || other.saleId == saleId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerId,saleId,amount,type,notes,createdAt);

@override
String toString() {
  return 'LedgerEntryEntity(id: $id, customerId: $customerId, saleId: $saleId, amount: $amount, type: $type, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $LedgerEntryEntityCopyWith<$Res>  {
  factory $LedgerEntryEntityCopyWith(LedgerEntryEntity value, $Res Function(LedgerEntryEntity) _then) = _$LedgerEntryEntityCopyWithImpl;
@useResult
$Res call({
 String id, String customerId, String? saleId, double amount, LedgerEntryType type, String? notes, DateTime createdAt
});




}
/// @nodoc
class _$LedgerEntryEntityCopyWithImpl<$Res>
    implements $LedgerEntryEntityCopyWith<$Res> {
  _$LedgerEntryEntityCopyWithImpl(this._self, this._then);

  final LedgerEntryEntity _self;
  final $Res Function(LedgerEntryEntity) _then;

/// Create a copy of LedgerEntryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? saleId = freezed,Object? amount = null,Object? type = null,Object? notes = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,saleId: freezed == saleId ? _self.saleId : saleId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LedgerEntryType,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerEntryEntity].
extension LedgerEntryEntityPatterns on LedgerEntryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerEntryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerEntryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerEntryEntity value)  $default,){
final _that = this;
switch (_that) {
case _LedgerEntryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerEntryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerEntryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String customerId,  String? saleId,  double amount,  LedgerEntryType type,  String? notes,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerEntryEntity() when $default != null:
return $default(_that.id,_that.customerId,_that.saleId,_that.amount,_that.type,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String customerId,  String? saleId,  double amount,  LedgerEntryType type,  String? notes,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _LedgerEntryEntity():
return $default(_that.id,_that.customerId,_that.saleId,_that.amount,_that.type,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String customerId,  String? saleId,  double amount,  LedgerEntryType type,  String? notes,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _LedgerEntryEntity() when $default != null:
return $default(_that.id,_that.customerId,_that.saleId,_that.amount,_that.type,_that.notes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _LedgerEntryEntity implements LedgerEntryEntity {
  const _LedgerEntryEntity({required this.id, required this.customerId, this.saleId, required this.amount, required this.type, this.notes, required this.createdAt});
  

@override final  String id;
@override final  String customerId;
@override final  String? saleId;
@override final  double amount;
@override final  LedgerEntryType type;
@override final  String? notes;
@override final  DateTime createdAt;

/// Create a copy of LedgerEntryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerEntryEntityCopyWith<_LedgerEntryEntity> get copyWith => __$LedgerEntryEntityCopyWithImpl<_LedgerEntryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerEntryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.saleId, saleId) || other.saleId == saleId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerId,saleId,amount,type,notes,createdAt);

@override
String toString() {
  return 'LedgerEntryEntity(id: $id, customerId: $customerId, saleId: $saleId, amount: $amount, type: $type, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$LedgerEntryEntityCopyWith<$Res> implements $LedgerEntryEntityCopyWith<$Res> {
  factory _$LedgerEntryEntityCopyWith(_LedgerEntryEntity value, $Res Function(_LedgerEntryEntity) _then) = __$LedgerEntryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String customerId, String? saleId, double amount, LedgerEntryType type, String? notes, DateTime createdAt
});




}
/// @nodoc
class __$LedgerEntryEntityCopyWithImpl<$Res>
    implements _$LedgerEntryEntityCopyWith<$Res> {
  __$LedgerEntryEntityCopyWithImpl(this._self, this._then);

  final _LedgerEntryEntity _self;
  final $Res Function(_LedgerEntryEntity) _then;

/// Create a copy of LedgerEntryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? saleId = freezed,Object? amount = null,Object? type = null,Object? notes = freezed,Object? createdAt = null,}) {
  return _then(_LedgerEntryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,saleId: freezed == saleId ? _self.saleId : saleId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LedgerEntryType,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
