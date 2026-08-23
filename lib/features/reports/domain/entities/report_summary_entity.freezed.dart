// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_summary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopProductEntity {

 String get name; String? get category; int get quantity; double get revenue;
/// Create a copy of TopProductEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopProductEntityCopyWith<TopProductEntity> get copyWith => _$TopProductEntityCopyWithImpl<TopProductEntity>(this as TopProductEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopProductEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}


@override
int get hashCode => Object.hash(runtimeType,name,category,quantity,revenue);

@override
String toString() {
  return 'TopProductEntity(name: $name, category: $category, quantity: $quantity, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class $TopProductEntityCopyWith<$Res>  {
  factory $TopProductEntityCopyWith(TopProductEntity value, $Res Function(TopProductEntity) _then) = _$TopProductEntityCopyWithImpl;
@useResult
$Res call({
 String name, String? category, int quantity, double revenue
});




}
/// @nodoc
class _$TopProductEntityCopyWithImpl<$Res>
    implements $TopProductEntityCopyWith<$Res> {
  _$TopProductEntityCopyWithImpl(this._self, this._then);

  final TopProductEntity _self;
  final $Res Function(TopProductEntity) _then;

/// Create a copy of TopProductEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? category = freezed,Object? quantity = null,Object? revenue = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TopProductEntity].
extension TopProductEntityPatterns on TopProductEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopProductEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopProductEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopProductEntity value)  $default,){
final _that = this;
switch (_that) {
case _TopProductEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopProductEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TopProductEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? category,  int quantity,  double revenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopProductEntity() when $default != null:
return $default(_that.name,_that.category,_that.quantity,_that.revenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? category,  int quantity,  double revenue)  $default,) {final _that = this;
switch (_that) {
case _TopProductEntity():
return $default(_that.name,_that.category,_that.quantity,_that.revenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? category,  int quantity,  double revenue)?  $default,) {final _that = this;
switch (_that) {
case _TopProductEntity() when $default != null:
return $default(_that.name,_that.category,_that.quantity,_that.revenue);case _:
  return null;

}
}

}

/// @nodoc


class _TopProductEntity implements TopProductEntity {
  const _TopProductEntity({required this.name, this.category, required this.quantity, required this.revenue});
  

@override final  String name;
@override final  String? category;
@override final  int quantity;
@override final  double revenue;

/// Create a copy of TopProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopProductEntityCopyWith<_TopProductEntity> get copyWith => __$TopProductEntityCopyWithImpl<_TopProductEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopProductEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}


@override
int get hashCode => Object.hash(runtimeType,name,category,quantity,revenue);

@override
String toString() {
  return 'TopProductEntity(name: $name, category: $category, quantity: $quantity, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class _$TopProductEntityCopyWith<$Res> implements $TopProductEntityCopyWith<$Res> {
  factory _$TopProductEntityCopyWith(_TopProductEntity value, $Res Function(_TopProductEntity) _then) = __$TopProductEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String? category, int quantity, double revenue
});




}
/// @nodoc
class __$TopProductEntityCopyWithImpl<$Res>
    implements _$TopProductEntityCopyWith<$Res> {
  __$TopProductEntityCopyWithImpl(this._self, this._then);

  final _TopProductEntity _self;
  final $Res Function(_TopProductEntity) _then;

/// Create a copy of TopProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? category = freezed,Object? quantity = null,Object? revenue = null,}) {
  return _then(_TopProductEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$BestCustomerEntity {

 String get id; String get name; int get visitCount; double get totalSpent;
/// Create a copy of BestCustomerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BestCustomerEntityCopyWith<BestCustomerEntity> get copyWith => _$BestCustomerEntityCopyWithImpl<BestCustomerEntity>(this as BestCustomerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BestCustomerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.visitCount, visitCount) || other.visitCount == visitCount)&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,visitCount,totalSpent);

@override
String toString() {
  return 'BestCustomerEntity(id: $id, name: $name, visitCount: $visitCount, totalSpent: $totalSpent)';
}


}

/// @nodoc
abstract mixin class $BestCustomerEntityCopyWith<$Res>  {
  factory $BestCustomerEntityCopyWith(BestCustomerEntity value, $Res Function(BestCustomerEntity) _then) = _$BestCustomerEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, int visitCount, double totalSpent
});




}
/// @nodoc
class _$BestCustomerEntityCopyWithImpl<$Res>
    implements $BestCustomerEntityCopyWith<$Res> {
  _$BestCustomerEntityCopyWithImpl(this._self, this._then);

  final BestCustomerEntity _self;
  final $Res Function(BestCustomerEntity) _then;

/// Create a copy of BestCustomerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? visitCount = null,Object? totalSpent = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,visitCount: null == visitCount ? _self.visitCount : visitCount // ignore: cast_nullable_to_non_nullable
as int,totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BestCustomerEntity].
extension BestCustomerEntityPatterns on BestCustomerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BestCustomerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BestCustomerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BestCustomerEntity value)  $default,){
final _that = this;
switch (_that) {
case _BestCustomerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BestCustomerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BestCustomerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int visitCount,  double totalSpent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BestCustomerEntity() when $default != null:
return $default(_that.id,_that.name,_that.visitCount,_that.totalSpent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int visitCount,  double totalSpent)  $default,) {final _that = this;
switch (_that) {
case _BestCustomerEntity():
return $default(_that.id,_that.name,_that.visitCount,_that.totalSpent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int visitCount,  double totalSpent)?  $default,) {final _that = this;
switch (_that) {
case _BestCustomerEntity() when $default != null:
return $default(_that.id,_that.name,_that.visitCount,_that.totalSpent);case _:
  return null;

}
}

}

/// @nodoc


class _BestCustomerEntity implements BestCustomerEntity {
  const _BestCustomerEntity({required this.id, required this.name, required this.visitCount, required this.totalSpent});
  

@override final  String id;
@override final  String name;
@override final  int visitCount;
@override final  double totalSpent;

/// Create a copy of BestCustomerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BestCustomerEntityCopyWith<_BestCustomerEntity> get copyWith => __$BestCustomerEntityCopyWithImpl<_BestCustomerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BestCustomerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.visitCount, visitCount) || other.visitCount == visitCount)&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,visitCount,totalSpent);

@override
String toString() {
  return 'BestCustomerEntity(id: $id, name: $name, visitCount: $visitCount, totalSpent: $totalSpent)';
}


}

/// @nodoc
abstract mixin class _$BestCustomerEntityCopyWith<$Res> implements $BestCustomerEntityCopyWith<$Res> {
  factory _$BestCustomerEntityCopyWith(_BestCustomerEntity value, $Res Function(_BestCustomerEntity) _then) = __$BestCustomerEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int visitCount, double totalSpent
});




}
/// @nodoc
class __$BestCustomerEntityCopyWithImpl<$Res>
    implements _$BestCustomerEntityCopyWith<$Res> {
  __$BestCustomerEntityCopyWithImpl(this._self, this._then);

  final _BestCustomerEntity _self;
  final $Res Function(_BestCustomerEntity) _then;

/// Create a copy of BestCustomerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? visitCount = null,Object? totalSpent = null,}) {
  return _then(_BestCustomerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,visitCount: null == visitCount ? _self.visitCount : visitCount // ignore: cast_nullable_to_non_nullable
as int,totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ReportSummaryEntity {

 DateTime get startDate; DateTime get endDate; double get totalSales; double get cashSales; double get ledgerSales; double get netProfit; double? get revenueGrowthPercent; double get ledgerOutstanding; int get ledgerCustomerCount; List<TopProductEntity> get topProducts; List<BestCustomerEntity> get bestCustomers;
/// Create a copy of ReportSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSummaryEntityCopyWith<ReportSummaryEntity> get copyWith => _$ReportSummaryEntityCopyWithImpl<ReportSummaryEntity>(this as ReportSummaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSummaryEntity&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashSales, cashSales) || other.cashSales == cashSales)&&(identical(other.ledgerSales, ledgerSales) || other.ledgerSales == ledgerSales)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.revenueGrowthPercent, revenueGrowthPercent) || other.revenueGrowthPercent == revenueGrowthPercent)&&(identical(other.ledgerOutstanding, ledgerOutstanding) || other.ledgerOutstanding == ledgerOutstanding)&&(identical(other.ledgerCustomerCount, ledgerCustomerCount) || other.ledgerCustomerCount == ledgerCustomerCount)&&const DeepCollectionEquality().equals(other.topProducts, topProducts)&&const DeepCollectionEquality().equals(other.bestCustomers, bestCustomers));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,totalSales,cashSales,ledgerSales,netProfit,revenueGrowthPercent,ledgerOutstanding,ledgerCustomerCount,const DeepCollectionEquality().hash(topProducts),const DeepCollectionEquality().hash(bestCustomers));

@override
String toString() {
  return 'ReportSummaryEntity(startDate: $startDate, endDate: $endDate, totalSales: $totalSales, cashSales: $cashSales, ledgerSales: $ledgerSales, netProfit: $netProfit, revenueGrowthPercent: $revenueGrowthPercent, ledgerOutstanding: $ledgerOutstanding, ledgerCustomerCount: $ledgerCustomerCount, topProducts: $topProducts, bestCustomers: $bestCustomers)';
}


}

/// @nodoc
abstract mixin class $ReportSummaryEntityCopyWith<$Res>  {
  factory $ReportSummaryEntityCopyWith(ReportSummaryEntity value, $Res Function(ReportSummaryEntity) _then) = _$ReportSummaryEntityCopyWithImpl;
@useResult
$Res call({
 DateTime startDate, DateTime endDate, double totalSales, double cashSales, double ledgerSales, double netProfit, double? revenueGrowthPercent, double ledgerOutstanding, int ledgerCustomerCount, List<TopProductEntity> topProducts, List<BestCustomerEntity> bestCustomers
});




}
/// @nodoc
class _$ReportSummaryEntityCopyWithImpl<$Res>
    implements $ReportSummaryEntityCopyWith<$Res> {
  _$ReportSummaryEntityCopyWithImpl(this._self, this._then);

  final ReportSummaryEntity _self;
  final $Res Function(ReportSummaryEntity) _then;

/// Create a copy of ReportSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,Object? totalSales = null,Object? cashSales = null,Object? ledgerSales = null,Object? netProfit = null,Object? revenueGrowthPercent = freezed,Object? ledgerOutstanding = null,Object? ledgerCustomerCount = null,Object? topProducts = null,Object? bestCustomers = null,}) {
  return _then(_self.copyWith(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,cashSales: null == cashSales ? _self.cashSales : cashSales // ignore: cast_nullable_to_non_nullable
as double,ledgerSales: null == ledgerSales ? _self.ledgerSales : ledgerSales // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,revenueGrowthPercent: freezed == revenueGrowthPercent ? _self.revenueGrowthPercent : revenueGrowthPercent // ignore: cast_nullable_to_non_nullable
as double?,ledgerOutstanding: null == ledgerOutstanding ? _self.ledgerOutstanding : ledgerOutstanding // ignore: cast_nullable_to_non_nullable
as double,ledgerCustomerCount: null == ledgerCustomerCount ? _self.ledgerCustomerCount : ledgerCustomerCount // ignore: cast_nullable_to_non_nullable
as int,topProducts: null == topProducts ? _self.topProducts : topProducts // ignore: cast_nullable_to_non_nullable
as List<TopProductEntity>,bestCustomers: null == bestCustomers ? _self.bestCustomers : bestCustomers // ignore: cast_nullable_to_non_nullable
as List<BestCustomerEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportSummaryEntity].
extension ReportSummaryEntityPatterns on ReportSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReportSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReportSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  double totalSales,  double cashSales,  double ledgerSales,  double netProfit,  double? revenueGrowthPercent,  double ledgerOutstanding,  int ledgerCustomerCount,  List<TopProductEntity> topProducts,  List<BestCustomerEntity> bestCustomers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportSummaryEntity() when $default != null:
return $default(_that.startDate,_that.endDate,_that.totalSales,_that.cashSales,_that.ledgerSales,_that.netProfit,_that.revenueGrowthPercent,_that.ledgerOutstanding,_that.ledgerCustomerCount,_that.topProducts,_that.bestCustomers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  double totalSales,  double cashSales,  double ledgerSales,  double netProfit,  double? revenueGrowthPercent,  double ledgerOutstanding,  int ledgerCustomerCount,  List<TopProductEntity> topProducts,  List<BestCustomerEntity> bestCustomers)  $default,) {final _that = this;
switch (_that) {
case _ReportSummaryEntity():
return $default(_that.startDate,_that.endDate,_that.totalSales,_that.cashSales,_that.ledgerSales,_that.netProfit,_that.revenueGrowthPercent,_that.ledgerOutstanding,_that.ledgerCustomerCount,_that.topProducts,_that.bestCustomers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startDate,  DateTime endDate,  double totalSales,  double cashSales,  double ledgerSales,  double netProfit,  double? revenueGrowthPercent,  double ledgerOutstanding,  int ledgerCustomerCount,  List<TopProductEntity> topProducts,  List<BestCustomerEntity> bestCustomers)?  $default,) {final _that = this;
switch (_that) {
case _ReportSummaryEntity() when $default != null:
return $default(_that.startDate,_that.endDate,_that.totalSales,_that.cashSales,_that.ledgerSales,_that.netProfit,_that.revenueGrowthPercent,_that.ledgerOutstanding,_that.ledgerCustomerCount,_that.topProducts,_that.bestCustomers);case _:
  return null;

}
}

}

/// @nodoc


class _ReportSummaryEntity implements ReportSummaryEntity {
  const _ReportSummaryEntity({required this.startDate, required this.endDate, this.totalSales = 0, this.cashSales = 0, this.ledgerSales = 0, this.netProfit = 0, this.revenueGrowthPercent, this.ledgerOutstanding = 0, this.ledgerCustomerCount = 0, final  List<TopProductEntity> topProducts = const [], final  List<BestCustomerEntity> bestCustomers = const []}): _topProducts = topProducts,_bestCustomers = bestCustomers;
  

@override final  DateTime startDate;
@override final  DateTime endDate;
@override@JsonKey() final  double totalSales;
@override@JsonKey() final  double cashSales;
@override@JsonKey() final  double ledgerSales;
@override@JsonKey() final  double netProfit;
@override final  double? revenueGrowthPercent;
@override@JsonKey() final  double ledgerOutstanding;
@override@JsonKey() final  int ledgerCustomerCount;
 final  List<TopProductEntity> _topProducts;
@override@JsonKey() List<TopProductEntity> get topProducts {
  if (_topProducts is EqualUnmodifiableListView) return _topProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topProducts);
}

 final  List<BestCustomerEntity> _bestCustomers;
@override@JsonKey() List<BestCustomerEntity> get bestCustomers {
  if (_bestCustomers is EqualUnmodifiableListView) return _bestCustomers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestCustomers);
}


/// Create a copy of ReportSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportSummaryEntityCopyWith<_ReportSummaryEntity> get copyWith => __$ReportSummaryEntityCopyWithImpl<_ReportSummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportSummaryEntity&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashSales, cashSales) || other.cashSales == cashSales)&&(identical(other.ledgerSales, ledgerSales) || other.ledgerSales == ledgerSales)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.revenueGrowthPercent, revenueGrowthPercent) || other.revenueGrowthPercent == revenueGrowthPercent)&&(identical(other.ledgerOutstanding, ledgerOutstanding) || other.ledgerOutstanding == ledgerOutstanding)&&(identical(other.ledgerCustomerCount, ledgerCustomerCount) || other.ledgerCustomerCount == ledgerCustomerCount)&&const DeepCollectionEquality().equals(other._topProducts, _topProducts)&&const DeepCollectionEquality().equals(other._bestCustomers, _bestCustomers));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,totalSales,cashSales,ledgerSales,netProfit,revenueGrowthPercent,ledgerOutstanding,ledgerCustomerCount,const DeepCollectionEquality().hash(_topProducts),const DeepCollectionEquality().hash(_bestCustomers));

@override
String toString() {
  return 'ReportSummaryEntity(startDate: $startDate, endDate: $endDate, totalSales: $totalSales, cashSales: $cashSales, ledgerSales: $ledgerSales, netProfit: $netProfit, revenueGrowthPercent: $revenueGrowthPercent, ledgerOutstanding: $ledgerOutstanding, ledgerCustomerCount: $ledgerCustomerCount, topProducts: $topProducts, bestCustomers: $bestCustomers)';
}


}

/// @nodoc
abstract mixin class _$ReportSummaryEntityCopyWith<$Res> implements $ReportSummaryEntityCopyWith<$Res> {
  factory _$ReportSummaryEntityCopyWith(_ReportSummaryEntity value, $Res Function(_ReportSummaryEntity) _then) = __$ReportSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime startDate, DateTime endDate, double totalSales, double cashSales, double ledgerSales, double netProfit, double? revenueGrowthPercent, double ledgerOutstanding, int ledgerCustomerCount, List<TopProductEntity> topProducts, List<BestCustomerEntity> bestCustomers
});




}
/// @nodoc
class __$ReportSummaryEntityCopyWithImpl<$Res>
    implements _$ReportSummaryEntityCopyWith<$Res> {
  __$ReportSummaryEntityCopyWithImpl(this._self, this._then);

  final _ReportSummaryEntity _self;
  final $Res Function(_ReportSummaryEntity) _then;

/// Create a copy of ReportSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,Object? totalSales = null,Object? cashSales = null,Object? ledgerSales = null,Object? netProfit = null,Object? revenueGrowthPercent = freezed,Object? ledgerOutstanding = null,Object? ledgerCustomerCount = null,Object? topProducts = null,Object? bestCustomers = null,}) {
  return _then(_ReportSummaryEntity(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,cashSales: null == cashSales ? _self.cashSales : cashSales // ignore: cast_nullable_to_non_nullable
as double,ledgerSales: null == ledgerSales ? _self.ledgerSales : ledgerSales // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,revenueGrowthPercent: freezed == revenueGrowthPercent ? _self.revenueGrowthPercent : revenueGrowthPercent // ignore: cast_nullable_to_non_nullable
as double?,ledgerOutstanding: null == ledgerOutstanding ? _self.ledgerOutstanding : ledgerOutstanding // ignore: cast_nullable_to_non_nullable
as double,ledgerCustomerCount: null == ledgerCustomerCount ? _self.ledgerCustomerCount : ledgerCustomerCount // ignore: cast_nullable_to_non_nullable
as int,topProducts: null == topProducts ? _self._topProducts : topProducts // ignore: cast_nullable_to_non_nullable
as List<TopProductEntity>,bestCustomers: null == bestCustomers ? _self._bestCustomers : bestCustomers // ignore: cast_nullable_to_non_nullable
as List<BestCustomerEntity>,
  ));
}


}

// dart format on
