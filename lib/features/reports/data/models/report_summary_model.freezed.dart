// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopProductModel {

 String get name; String? get category; int get quantity; double get revenue;
/// Create a copy of TopProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopProductModelCopyWith<TopProductModel> get copyWith => _$TopProductModelCopyWithImpl<TopProductModel>(this as TopProductModel, _$identity);

  /// Serializes this TopProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopProductModel&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,category,quantity,revenue);

@override
String toString() {
  return 'TopProductModel(name: $name, category: $category, quantity: $quantity, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class $TopProductModelCopyWith<$Res>  {
  factory $TopProductModelCopyWith(TopProductModel value, $Res Function(TopProductModel) _then) = _$TopProductModelCopyWithImpl;
@useResult
$Res call({
 String name, String? category, int quantity, double revenue
});




}
/// @nodoc
class _$TopProductModelCopyWithImpl<$Res>
    implements $TopProductModelCopyWith<$Res> {
  _$TopProductModelCopyWithImpl(this._self, this._then);

  final TopProductModel _self;
  final $Res Function(TopProductModel) _then;

/// Create a copy of TopProductModel
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


/// Adds pattern-matching-related methods to [TopProductModel].
extension TopProductModelPatterns on TopProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopProductModel value)  $default,){
final _that = this;
switch (_that) {
case _TopProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopProductModel() when $default != null:
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
case _TopProductModel() when $default != null:
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
case _TopProductModel():
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
case _TopProductModel() when $default != null:
return $default(_that.name,_that.category,_that.quantity,_that.revenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopProductModel extends TopProductModel {
  const _TopProductModel({required this.name, this.category, required this.quantity, required this.revenue}): super._();
  factory _TopProductModel.fromJson(Map<String, dynamic> json) => _$TopProductModelFromJson(json);

@override final  String name;
@override final  String? category;
@override final  int quantity;
@override final  double revenue;

/// Create a copy of TopProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopProductModelCopyWith<_TopProductModel> get copyWith => __$TopProductModelCopyWithImpl<_TopProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopProductModel&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,category,quantity,revenue);

@override
String toString() {
  return 'TopProductModel(name: $name, category: $category, quantity: $quantity, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class _$TopProductModelCopyWith<$Res> implements $TopProductModelCopyWith<$Res> {
  factory _$TopProductModelCopyWith(_TopProductModel value, $Res Function(_TopProductModel) _then) = __$TopProductModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String? category, int quantity, double revenue
});




}
/// @nodoc
class __$TopProductModelCopyWithImpl<$Res>
    implements _$TopProductModelCopyWith<$Res> {
  __$TopProductModelCopyWithImpl(this._self, this._then);

  final _TopProductModel _self;
  final $Res Function(_TopProductModel) _then;

/// Create a copy of TopProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? category = freezed,Object? quantity = null,Object? revenue = null,}) {
  return _then(_TopProductModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$BestCustomerModel {

 String get id; String get name;@JsonKey(name: 'visit_count') int get visitCount;@JsonKey(name: 'total_spent') double get totalSpent;
/// Create a copy of BestCustomerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BestCustomerModelCopyWith<BestCustomerModel> get copyWith => _$BestCustomerModelCopyWithImpl<BestCustomerModel>(this as BestCustomerModel, _$identity);

  /// Serializes this BestCustomerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BestCustomerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.visitCount, visitCount) || other.visitCount == visitCount)&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,visitCount,totalSpent);

@override
String toString() {
  return 'BestCustomerModel(id: $id, name: $name, visitCount: $visitCount, totalSpent: $totalSpent)';
}


}

/// @nodoc
abstract mixin class $BestCustomerModelCopyWith<$Res>  {
  factory $BestCustomerModelCopyWith(BestCustomerModel value, $Res Function(BestCustomerModel) _then) = _$BestCustomerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'visit_count') int visitCount,@JsonKey(name: 'total_spent') double totalSpent
});




}
/// @nodoc
class _$BestCustomerModelCopyWithImpl<$Res>
    implements $BestCustomerModelCopyWith<$Res> {
  _$BestCustomerModelCopyWithImpl(this._self, this._then);

  final BestCustomerModel _self;
  final $Res Function(BestCustomerModel) _then;

/// Create a copy of BestCustomerModel
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


/// Adds pattern-matching-related methods to [BestCustomerModel].
extension BestCustomerModelPatterns on BestCustomerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BestCustomerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BestCustomerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BestCustomerModel value)  $default,){
final _that = this;
switch (_that) {
case _BestCustomerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BestCustomerModel value)?  $default,){
final _that = this;
switch (_that) {
case _BestCustomerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'visit_count')  int visitCount, @JsonKey(name: 'total_spent')  double totalSpent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BestCustomerModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'visit_count')  int visitCount, @JsonKey(name: 'total_spent')  double totalSpent)  $default,) {final _that = this;
switch (_that) {
case _BestCustomerModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'visit_count')  int visitCount, @JsonKey(name: 'total_spent')  double totalSpent)?  $default,) {final _that = this;
switch (_that) {
case _BestCustomerModel() when $default != null:
return $default(_that.id,_that.name,_that.visitCount,_that.totalSpent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BestCustomerModel extends BestCustomerModel {
  const _BestCustomerModel({required this.id, required this.name, @JsonKey(name: 'visit_count') required this.visitCount, @JsonKey(name: 'total_spent') required this.totalSpent}): super._();
  factory _BestCustomerModel.fromJson(Map<String, dynamic> json) => _$BestCustomerModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'visit_count') final  int visitCount;
@override@JsonKey(name: 'total_spent') final  double totalSpent;

/// Create a copy of BestCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BestCustomerModelCopyWith<_BestCustomerModel> get copyWith => __$BestCustomerModelCopyWithImpl<_BestCustomerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BestCustomerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BestCustomerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.visitCount, visitCount) || other.visitCount == visitCount)&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,visitCount,totalSpent);

@override
String toString() {
  return 'BestCustomerModel(id: $id, name: $name, visitCount: $visitCount, totalSpent: $totalSpent)';
}


}

/// @nodoc
abstract mixin class _$BestCustomerModelCopyWith<$Res> implements $BestCustomerModelCopyWith<$Res> {
  factory _$BestCustomerModelCopyWith(_BestCustomerModel value, $Res Function(_BestCustomerModel) _then) = __$BestCustomerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'visit_count') int visitCount,@JsonKey(name: 'total_spent') double totalSpent
});




}
/// @nodoc
class __$BestCustomerModelCopyWithImpl<$Res>
    implements _$BestCustomerModelCopyWith<$Res> {
  __$BestCustomerModelCopyWithImpl(this._self, this._then);

  final _BestCustomerModel _self;
  final $Res Function(_BestCustomerModel) _then;

/// Create a copy of BestCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? visitCount = null,Object? totalSpent = null,}) {
  return _then(_BestCustomerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,visitCount: null == visitCount ? _self.visitCount : visitCount // ignore: cast_nullable_to_non_nullable
as int,totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ReportSummaryModel {

@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate;@JsonKey(name: 'total_sales') double get totalSales;@JsonKey(name: 'cash_sales') double get cashSales;@JsonKey(name: 'ledger_sales') double get ledgerSales;@JsonKey(name: 'net_profit') double get netProfit;@JsonKey(name: 'revenue_growth_percent') double? get revenueGrowthPercent;@JsonKey(name: 'ledger_outstanding') double get ledgerOutstanding;@JsonKey(name: 'ledger_customer_count') int get ledgerCustomerCount;@JsonKey(name: 'top_products') List<TopProductModel> get topProducts;@JsonKey(name: 'best_customers') List<BestCustomerModel> get bestCustomers;
/// Create a copy of ReportSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSummaryModelCopyWith<ReportSummaryModel> get copyWith => _$ReportSummaryModelCopyWithImpl<ReportSummaryModel>(this as ReportSummaryModel, _$identity);

  /// Serializes this ReportSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSummaryModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashSales, cashSales) || other.cashSales == cashSales)&&(identical(other.ledgerSales, ledgerSales) || other.ledgerSales == ledgerSales)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.revenueGrowthPercent, revenueGrowthPercent) || other.revenueGrowthPercent == revenueGrowthPercent)&&(identical(other.ledgerOutstanding, ledgerOutstanding) || other.ledgerOutstanding == ledgerOutstanding)&&(identical(other.ledgerCustomerCount, ledgerCustomerCount) || other.ledgerCustomerCount == ledgerCustomerCount)&&const DeepCollectionEquality().equals(other.topProducts, topProducts)&&const DeepCollectionEquality().equals(other.bestCustomers, bestCustomers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,totalSales,cashSales,ledgerSales,netProfit,revenueGrowthPercent,ledgerOutstanding,ledgerCustomerCount,const DeepCollectionEquality().hash(topProducts),const DeepCollectionEquality().hash(bestCustomers));

@override
String toString() {
  return 'ReportSummaryModel(startDate: $startDate, endDate: $endDate, totalSales: $totalSales, cashSales: $cashSales, ledgerSales: $ledgerSales, netProfit: $netProfit, revenueGrowthPercent: $revenueGrowthPercent, ledgerOutstanding: $ledgerOutstanding, ledgerCustomerCount: $ledgerCustomerCount, topProducts: $topProducts, bestCustomers: $bestCustomers)';
}


}

/// @nodoc
abstract mixin class $ReportSummaryModelCopyWith<$Res>  {
  factory $ReportSummaryModelCopyWith(ReportSummaryModel value, $Res Function(ReportSummaryModel) _then) = _$ReportSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'cash_sales') double cashSales,@JsonKey(name: 'ledger_sales') double ledgerSales,@JsonKey(name: 'net_profit') double netProfit,@JsonKey(name: 'revenue_growth_percent') double? revenueGrowthPercent,@JsonKey(name: 'ledger_outstanding') double ledgerOutstanding,@JsonKey(name: 'ledger_customer_count') int ledgerCustomerCount,@JsonKey(name: 'top_products') List<TopProductModel> topProducts,@JsonKey(name: 'best_customers') List<BestCustomerModel> bestCustomers
});




}
/// @nodoc
class _$ReportSummaryModelCopyWithImpl<$Res>
    implements $ReportSummaryModelCopyWith<$Res> {
  _$ReportSummaryModelCopyWithImpl(this._self, this._then);

  final ReportSummaryModel _self;
  final $Res Function(ReportSummaryModel) _then;

/// Create a copy of ReportSummaryModel
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
as List<TopProductModel>,bestCustomers: null == bestCustomers ? _self.bestCustomers : bestCustomers // ignore: cast_nullable_to_non_nullable
as List<BestCustomerModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportSummaryModel].
extension ReportSummaryModelPatterns on ReportSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'cash_sales')  double cashSales, @JsonKey(name: 'ledger_sales')  double ledgerSales, @JsonKey(name: 'net_profit')  double netProfit, @JsonKey(name: 'revenue_growth_percent')  double? revenueGrowthPercent, @JsonKey(name: 'ledger_outstanding')  double ledgerOutstanding, @JsonKey(name: 'ledger_customer_count')  int ledgerCustomerCount, @JsonKey(name: 'top_products')  List<TopProductModel> topProducts, @JsonKey(name: 'best_customers')  List<BestCustomerModel> bestCustomers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportSummaryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'cash_sales')  double cashSales, @JsonKey(name: 'ledger_sales')  double ledgerSales, @JsonKey(name: 'net_profit')  double netProfit, @JsonKey(name: 'revenue_growth_percent')  double? revenueGrowthPercent, @JsonKey(name: 'ledger_outstanding')  double ledgerOutstanding, @JsonKey(name: 'ledger_customer_count')  int ledgerCustomerCount, @JsonKey(name: 'top_products')  List<TopProductModel> topProducts, @JsonKey(name: 'best_customers')  List<BestCustomerModel> bestCustomers)  $default,) {final _that = this;
switch (_that) {
case _ReportSummaryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'cash_sales')  double cashSales, @JsonKey(name: 'ledger_sales')  double ledgerSales, @JsonKey(name: 'net_profit')  double netProfit, @JsonKey(name: 'revenue_growth_percent')  double? revenueGrowthPercent, @JsonKey(name: 'ledger_outstanding')  double ledgerOutstanding, @JsonKey(name: 'ledger_customer_count')  int ledgerCustomerCount, @JsonKey(name: 'top_products')  List<TopProductModel> topProducts, @JsonKey(name: 'best_customers')  List<BestCustomerModel> bestCustomers)?  $default,) {final _that = this;
switch (_that) {
case _ReportSummaryModel() when $default != null:
return $default(_that.startDate,_that.endDate,_that.totalSales,_that.cashSales,_that.ledgerSales,_that.netProfit,_that.revenueGrowthPercent,_that.ledgerOutstanding,_that.ledgerCustomerCount,_that.topProducts,_that.bestCustomers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportSummaryModel extends ReportSummaryModel {
  const _ReportSummaryModel({@JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'total_sales') this.totalSales = 0, @JsonKey(name: 'cash_sales') this.cashSales = 0, @JsonKey(name: 'ledger_sales') this.ledgerSales = 0, @JsonKey(name: 'net_profit') this.netProfit = 0, @JsonKey(name: 'revenue_growth_percent') this.revenueGrowthPercent, @JsonKey(name: 'ledger_outstanding') this.ledgerOutstanding = 0, @JsonKey(name: 'ledger_customer_count') this.ledgerCustomerCount = 0, @JsonKey(name: 'top_products') final  List<TopProductModel> topProducts = const [], @JsonKey(name: 'best_customers') final  List<BestCustomerModel> bestCustomers = const []}): _topProducts = topProducts,_bestCustomers = bestCustomers,super._();
  factory _ReportSummaryModel.fromJson(Map<String, dynamic> json) => _$ReportSummaryModelFromJson(json);

@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;
@override@JsonKey(name: 'total_sales') final  double totalSales;
@override@JsonKey(name: 'cash_sales') final  double cashSales;
@override@JsonKey(name: 'ledger_sales') final  double ledgerSales;
@override@JsonKey(name: 'net_profit') final  double netProfit;
@override@JsonKey(name: 'revenue_growth_percent') final  double? revenueGrowthPercent;
@override@JsonKey(name: 'ledger_outstanding') final  double ledgerOutstanding;
@override@JsonKey(name: 'ledger_customer_count') final  int ledgerCustomerCount;
 final  List<TopProductModel> _topProducts;
@override@JsonKey(name: 'top_products') List<TopProductModel> get topProducts {
  if (_topProducts is EqualUnmodifiableListView) return _topProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topProducts);
}

 final  List<BestCustomerModel> _bestCustomers;
@override@JsonKey(name: 'best_customers') List<BestCustomerModel> get bestCustomers {
  if (_bestCustomers is EqualUnmodifiableListView) return _bestCustomers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestCustomers);
}


/// Create a copy of ReportSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportSummaryModelCopyWith<_ReportSummaryModel> get copyWith => __$ReportSummaryModelCopyWithImpl<_ReportSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportSummaryModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashSales, cashSales) || other.cashSales == cashSales)&&(identical(other.ledgerSales, ledgerSales) || other.ledgerSales == ledgerSales)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.revenueGrowthPercent, revenueGrowthPercent) || other.revenueGrowthPercent == revenueGrowthPercent)&&(identical(other.ledgerOutstanding, ledgerOutstanding) || other.ledgerOutstanding == ledgerOutstanding)&&(identical(other.ledgerCustomerCount, ledgerCustomerCount) || other.ledgerCustomerCount == ledgerCustomerCount)&&const DeepCollectionEquality().equals(other._topProducts, _topProducts)&&const DeepCollectionEquality().equals(other._bestCustomers, _bestCustomers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,totalSales,cashSales,ledgerSales,netProfit,revenueGrowthPercent,ledgerOutstanding,ledgerCustomerCount,const DeepCollectionEquality().hash(_topProducts),const DeepCollectionEquality().hash(_bestCustomers));

@override
String toString() {
  return 'ReportSummaryModel(startDate: $startDate, endDate: $endDate, totalSales: $totalSales, cashSales: $cashSales, ledgerSales: $ledgerSales, netProfit: $netProfit, revenueGrowthPercent: $revenueGrowthPercent, ledgerOutstanding: $ledgerOutstanding, ledgerCustomerCount: $ledgerCustomerCount, topProducts: $topProducts, bestCustomers: $bestCustomers)';
}


}

/// @nodoc
abstract mixin class _$ReportSummaryModelCopyWith<$Res> implements $ReportSummaryModelCopyWith<$Res> {
  factory _$ReportSummaryModelCopyWith(_ReportSummaryModel value, $Res Function(_ReportSummaryModel) _then) = __$ReportSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'cash_sales') double cashSales,@JsonKey(name: 'ledger_sales') double ledgerSales,@JsonKey(name: 'net_profit') double netProfit,@JsonKey(name: 'revenue_growth_percent') double? revenueGrowthPercent,@JsonKey(name: 'ledger_outstanding') double ledgerOutstanding,@JsonKey(name: 'ledger_customer_count') int ledgerCustomerCount,@JsonKey(name: 'top_products') List<TopProductModel> topProducts,@JsonKey(name: 'best_customers') List<BestCustomerModel> bestCustomers
});




}
/// @nodoc
class __$ReportSummaryModelCopyWithImpl<$Res>
    implements _$ReportSummaryModelCopyWith<$Res> {
  __$ReportSummaryModelCopyWithImpl(this._self, this._then);

  final _ReportSummaryModel _self;
  final $Res Function(_ReportSummaryModel) _then;

/// Create a copy of ReportSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,Object? totalSales = null,Object? cashSales = null,Object? ledgerSales = null,Object? netProfit = null,Object? revenueGrowthPercent = freezed,Object? ledgerOutstanding = null,Object? ledgerCustomerCount = null,Object? topProducts = null,Object? bestCustomers = null,}) {
  return _then(_ReportSummaryModel(
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
as List<TopProductModel>,bestCustomers: null == bestCustomers ? _self._bestCustomers : bestCustomers // ignore: cast_nullable_to_non_nullable
as List<BestCustomerModel>,
  ));
}


}

// dart format on
