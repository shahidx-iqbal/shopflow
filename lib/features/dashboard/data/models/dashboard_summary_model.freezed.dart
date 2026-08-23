// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardSummaryModel {

@JsonKey(name: 'shop_name') String get shopName;@JsonKey(name: 'today_sales') double get todaySales;@JsonKey(name: 'sales_growth_percent') double get salesGrowthPercent;@JsonKey(name: 'low_stock_count') int get lowStockCount;@JsonKey(name: 'pending_ledger_amount') double get pendingLedgerAmount;@JsonKey(name: 'pending_ledger_accounts_count') int get pendingLedgerAccountsCount;@JsonKey(name: 'recent_transactions') List<DashboardRecentTransactionModel> get recentTransactions;@JsonKey(name: 'top_selling_products') List<DashboardTopProductModel> get topSellingProducts;
/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryModelCopyWith<DashboardSummaryModel> get copyWith => _$DashboardSummaryModelCopyWithImpl<DashboardSummaryModel>(this as DashboardSummaryModel, _$identity);

  /// Serializes this DashboardSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummaryModel&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.todaySales, todaySales) || other.todaySales == todaySales)&&(identical(other.salesGrowthPercent, salesGrowthPercent) || other.salesGrowthPercent == salesGrowthPercent)&&(identical(other.lowStockCount, lowStockCount) || other.lowStockCount == lowStockCount)&&(identical(other.pendingLedgerAmount, pendingLedgerAmount) || other.pendingLedgerAmount == pendingLedgerAmount)&&(identical(other.pendingLedgerAccountsCount, pendingLedgerAccountsCount) || other.pendingLedgerAccountsCount == pendingLedgerAccountsCount)&&const DeepCollectionEquality().equals(other.recentTransactions, recentTransactions)&&const DeepCollectionEquality().equals(other.topSellingProducts, topSellingProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopName,todaySales,salesGrowthPercent,lowStockCount,pendingLedgerAmount,pendingLedgerAccountsCount,const DeepCollectionEquality().hash(recentTransactions),const DeepCollectionEquality().hash(topSellingProducts));

@override
String toString() {
  return 'DashboardSummaryModel(shopName: $shopName, todaySales: $todaySales, salesGrowthPercent: $salesGrowthPercent, lowStockCount: $lowStockCount, pendingLedgerAmount: $pendingLedgerAmount, pendingLedgerAccountsCount: $pendingLedgerAccountsCount, recentTransactions: $recentTransactions, topSellingProducts: $topSellingProducts)';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryModelCopyWith<$Res>  {
  factory $DashboardSummaryModelCopyWith(DashboardSummaryModel value, $Res Function(DashboardSummaryModel) _then) = _$DashboardSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shop_name') String shopName,@JsonKey(name: 'today_sales') double todaySales,@JsonKey(name: 'sales_growth_percent') double salesGrowthPercent,@JsonKey(name: 'low_stock_count') int lowStockCount,@JsonKey(name: 'pending_ledger_amount') double pendingLedgerAmount,@JsonKey(name: 'pending_ledger_accounts_count') int pendingLedgerAccountsCount,@JsonKey(name: 'recent_transactions') List<DashboardRecentTransactionModel> recentTransactions,@JsonKey(name: 'top_selling_products') List<DashboardTopProductModel> topSellingProducts
});




}
/// @nodoc
class _$DashboardSummaryModelCopyWithImpl<$Res>
    implements $DashboardSummaryModelCopyWith<$Res> {
  _$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final DashboardSummaryModel _self;
  final $Res Function(DashboardSummaryModel) _then;

/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shopName = null,Object? todaySales = null,Object? salesGrowthPercent = null,Object? lowStockCount = null,Object? pendingLedgerAmount = null,Object? pendingLedgerAccountsCount = null,Object? recentTransactions = null,Object? topSellingProducts = null,}) {
  return _then(_self.copyWith(
shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,todaySales: null == todaySales ? _self.todaySales : todaySales // ignore: cast_nullable_to_non_nullable
as double,salesGrowthPercent: null == salesGrowthPercent ? _self.salesGrowthPercent : salesGrowthPercent // ignore: cast_nullable_to_non_nullable
as double,lowStockCount: null == lowStockCount ? _self.lowStockCount : lowStockCount // ignore: cast_nullable_to_non_nullable
as int,pendingLedgerAmount: null == pendingLedgerAmount ? _self.pendingLedgerAmount : pendingLedgerAmount // ignore: cast_nullable_to_non_nullable
as double,pendingLedgerAccountsCount: null == pendingLedgerAccountsCount ? _self.pendingLedgerAccountsCount : pendingLedgerAccountsCount // ignore: cast_nullable_to_non_nullable
as int,recentTransactions: null == recentTransactions ? _self.recentTransactions : recentTransactions // ignore: cast_nullable_to_non_nullable
as List<DashboardRecentTransactionModel>,topSellingProducts: null == topSellingProducts ? _self.topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<DashboardTopProductModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardSummaryModel].
extension DashboardSummaryModelPatterns on DashboardSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'shop_name')  String shopName, @JsonKey(name: 'today_sales')  double todaySales, @JsonKey(name: 'sales_growth_percent')  double salesGrowthPercent, @JsonKey(name: 'low_stock_count')  int lowStockCount, @JsonKey(name: 'pending_ledger_amount')  double pendingLedgerAmount, @JsonKey(name: 'pending_ledger_accounts_count')  int pendingLedgerAccountsCount, @JsonKey(name: 'recent_transactions')  List<DashboardRecentTransactionModel> recentTransactions, @JsonKey(name: 'top_selling_products')  List<DashboardTopProductModel> topSellingProducts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
return $default(_that.shopName,_that.todaySales,_that.salesGrowthPercent,_that.lowStockCount,_that.pendingLedgerAmount,_that.pendingLedgerAccountsCount,_that.recentTransactions,_that.topSellingProducts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'shop_name')  String shopName, @JsonKey(name: 'today_sales')  double todaySales, @JsonKey(name: 'sales_growth_percent')  double salesGrowthPercent, @JsonKey(name: 'low_stock_count')  int lowStockCount, @JsonKey(name: 'pending_ledger_amount')  double pendingLedgerAmount, @JsonKey(name: 'pending_ledger_accounts_count')  int pendingLedgerAccountsCount, @JsonKey(name: 'recent_transactions')  List<DashboardRecentTransactionModel> recentTransactions, @JsonKey(name: 'top_selling_products')  List<DashboardTopProductModel> topSellingProducts)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryModel():
return $default(_that.shopName,_that.todaySales,_that.salesGrowthPercent,_that.lowStockCount,_that.pendingLedgerAmount,_that.pendingLedgerAccountsCount,_that.recentTransactions,_that.topSellingProducts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'shop_name')  String shopName, @JsonKey(name: 'today_sales')  double todaySales, @JsonKey(name: 'sales_growth_percent')  double salesGrowthPercent, @JsonKey(name: 'low_stock_count')  int lowStockCount, @JsonKey(name: 'pending_ledger_amount')  double pendingLedgerAmount, @JsonKey(name: 'pending_ledger_accounts_count')  int pendingLedgerAccountsCount, @JsonKey(name: 'recent_transactions')  List<DashboardRecentTransactionModel> recentTransactions, @JsonKey(name: 'top_selling_products')  List<DashboardTopProductModel> topSellingProducts)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
return $default(_that.shopName,_that.todaySales,_that.salesGrowthPercent,_that.lowStockCount,_that.pendingLedgerAmount,_that.pendingLedgerAccountsCount,_that.recentTransactions,_that.topSellingProducts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSummaryModel extends DashboardSummaryModel {
  const _DashboardSummaryModel({@JsonKey(name: 'shop_name') this.shopName = '', @JsonKey(name: 'today_sales') this.todaySales = 0, @JsonKey(name: 'sales_growth_percent') this.salesGrowthPercent = 0, @JsonKey(name: 'low_stock_count') this.lowStockCount = 0, @JsonKey(name: 'pending_ledger_amount') this.pendingLedgerAmount = 0, @JsonKey(name: 'pending_ledger_accounts_count') this.pendingLedgerAccountsCount = 0, @JsonKey(name: 'recent_transactions') final  List<DashboardRecentTransactionModel> recentTransactions = const [], @JsonKey(name: 'top_selling_products') final  List<DashboardTopProductModel> topSellingProducts = const []}): _recentTransactions = recentTransactions,_topSellingProducts = topSellingProducts,super._();
  factory _DashboardSummaryModel.fromJson(Map<String, dynamic> json) => _$DashboardSummaryModelFromJson(json);

@override@JsonKey(name: 'shop_name') final  String shopName;
@override@JsonKey(name: 'today_sales') final  double todaySales;
@override@JsonKey(name: 'sales_growth_percent') final  double salesGrowthPercent;
@override@JsonKey(name: 'low_stock_count') final  int lowStockCount;
@override@JsonKey(name: 'pending_ledger_amount') final  double pendingLedgerAmount;
@override@JsonKey(name: 'pending_ledger_accounts_count') final  int pendingLedgerAccountsCount;
 final  List<DashboardRecentTransactionModel> _recentTransactions;
@override@JsonKey(name: 'recent_transactions') List<DashboardRecentTransactionModel> get recentTransactions {
  if (_recentTransactions is EqualUnmodifiableListView) return _recentTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentTransactions);
}

 final  List<DashboardTopProductModel> _topSellingProducts;
@override@JsonKey(name: 'top_selling_products') List<DashboardTopProductModel> get topSellingProducts {
  if (_topSellingProducts is EqualUnmodifiableListView) return _topSellingProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSellingProducts);
}


/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryModelCopyWith<_DashboardSummaryModel> get copyWith => __$DashboardSummaryModelCopyWithImpl<_DashboardSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummaryModel&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.todaySales, todaySales) || other.todaySales == todaySales)&&(identical(other.salesGrowthPercent, salesGrowthPercent) || other.salesGrowthPercent == salesGrowthPercent)&&(identical(other.lowStockCount, lowStockCount) || other.lowStockCount == lowStockCount)&&(identical(other.pendingLedgerAmount, pendingLedgerAmount) || other.pendingLedgerAmount == pendingLedgerAmount)&&(identical(other.pendingLedgerAccountsCount, pendingLedgerAccountsCount) || other.pendingLedgerAccountsCount == pendingLedgerAccountsCount)&&const DeepCollectionEquality().equals(other._recentTransactions, _recentTransactions)&&const DeepCollectionEquality().equals(other._topSellingProducts, _topSellingProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shopName,todaySales,salesGrowthPercent,lowStockCount,pendingLedgerAmount,pendingLedgerAccountsCount,const DeepCollectionEquality().hash(_recentTransactions),const DeepCollectionEquality().hash(_topSellingProducts));

@override
String toString() {
  return 'DashboardSummaryModel(shopName: $shopName, todaySales: $todaySales, salesGrowthPercent: $salesGrowthPercent, lowStockCount: $lowStockCount, pendingLedgerAmount: $pendingLedgerAmount, pendingLedgerAccountsCount: $pendingLedgerAccountsCount, recentTransactions: $recentTransactions, topSellingProducts: $topSellingProducts)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryModelCopyWith<$Res> implements $DashboardSummaryModelCopyWith<$Res> {
  factory _$DashboardSummaryModelCopyWith(_DashboardSummaryModel value, $Res Function(_DashboardSummaryModel) _then) = __$DashboardSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shop_name') String shopName,@JsonKey(name: 'today_sales') double todaySales,@JsonKey(name: 'sales_growth_percent') double salesGrowthPercent,@JsonKey(name: 'low_stock_count') int lowStockCount,@JsonKey(name: 'pending_ledger_amount') double pendingLedgerAmount,@JsonKey(name: 'pending_ledger_accounts_count') int pendingLedgerAccountsCount,@JsonKey(name: 'recent_transactions') List<DashboardRecentTransactionModel> recentTransactions,@JsonKey(name: 'top_selling_products') List<DashboardTopProductModel> topSellingProducts
});




}
/// @nodoc
class __$DashboardSummaryModelCopyWithImpl<$Res>
    implements _$DashboardSummaryModelCopyWith<$Res> {
  __$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final _DashboardSummaryModel _self;
  final $Res Function(_DashboardSummaryModel) _then;

/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shopName = null,Object? todaySales = null,Object? salesGrowthPercent = null,Object? lowStockCount = null,Object? pendingLedgerAmount = null,Object? pendingLedgerAccountsCount = null,Object? recentTransactions = null,Object? topSellingProducts = null,}) {
  return _then(_DashboardSummaryModel(
shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,todaySales: null == todaySales ? _self.todaySales : todaySales // ignore: cast_nullable_to_non_nullable
as double,salesGrowthPercent: null == salesGrowthPercent ? _self.salesGrowthPercent : salesGrowthPercent // ignore: cast_nullable_to_non_nullable
as double,lowStockCount: null == lowStockCount ? _self.lowStockCount : lowStockCount // ignore: cast_nullable_to_non_nullable
as int,pendingLedgerAmount: null == pendingLedgerAmount ? _self.pendingLedgerAmount : pendingLedgerAmount // ignore: cast_nullable_to_non_nullable
as double,pendingLedgerAccountsCount: null == pendingLedgerAccountsCount ? _self.pendingLedgerAccountsCount : pendingLedgerAccountsCount // ignore: cast_nullable_to_non_nullable
as int,recentTransactions: null == recentTransactions ? _self._recentTransactions : recentTransactions // ignore: cast_nullable_to_non_nullable
as List<DashboardRecentTransactionModel>,topSellingProducts: null == topSellingProducts ? _self._topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<DashboardTopProductModel>,
  ));
}


}

// dart format on
