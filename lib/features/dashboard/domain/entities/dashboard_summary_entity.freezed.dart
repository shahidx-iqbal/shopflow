// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardSummaryEntity {

 String get shopName; double get todaySales; double get salesGrowthPercent; int get lowStockCount; double get pendingLedgerAmount; int get pendingLedgerAccountsCount; List<DashboardRecentTransactionEntity> get recentTransactions; List<DashboardTopProductEntity> get topSellingProducts;
/// Create a copy of DashboardSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryEntityCopyWith<DashboardSummaryEntity> get copyWith => _$DashboardSummaryEntityCopyWithImpl<DashboardSummaryEntity>(this as DashboardSummaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummaryEntity&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.todaySales, todaySales) || other.todaySales == todaySales)&&(identical(other.salesGrowthPercent, salesGrowthPercent) || other.salesGrowthPercent == salesGrowthPercent)&&(identical(other.lowStockCount, lowStockCount) || other.lowStockCount == lowStockCount)&&(identical(other.pendingLedgerAmount, pendingLedgerAmount) || other.pendingLedgerAmount == pendingLedgerAmount)&&(identical(other.pendingLedgerAccountsCount, pendingLedgerAccountsCount) || other.pendingLedgerAccountsCount == pendingLedgerAccountsCount)&&const DeepCollectionEquality().equals(other.recentTransactions, recentTransactions)&&const DeepCollectionEquality().equals(other.topSellingProducts, topSellingProducts));
}


@override
int get hashCode => Object.hash(runtimeType,shopName,todaySales,salesGrowthPercent,lowStockCount,pendingLedgerAmount,pendingLedgerAccountsCount,const DeepCollectionEquality().hash(recentTransactions),const DeepCollectionEquality().hash(topSellingProducts));

@override
String toString() {
  return 'DashboardSummaryEntity(shopName: $shopName, todaySales: $todaySales, salesGrowthPercent: $salesGrowthPercent, lowStockCount: $lowStockCount, pendingLedgerAmount: $pendingLedgerAmount, pendingLedgerAccountsCount: $pendingLedgerAccountsCount, recentTransactions: $recentTransactions, topSellingProducts: $topSellingProducts)';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryEntityCopyWith<$Res>  {
  factory $DashboardSummaryEntityCopyWith(DashboardSummaryEntity value, $Res Function(DashboardSummaryEntity) _then) = _$DashboardSummaryEntityCopyWithImpl;
@useResult
$Res call({
 String shopName, double todaySales, double salesGrowthPercent, int lowStockCount, double pendingLedgerAmount, int pendingLedgerAccountsCount, List<DashboardRecentTransactionEntity> recentTransactions, List<DashboardTopProductEntity> topSellingProducts
});




}
/// @nodoc
class _$DashboardSummaryEntityCopyWithImpl<$Res>
    implements $DashboardSummaryEntityCopyWith<$Res> {
  _$DashboardSummaryEntityCopyWithImpl(this._self, this._then);

  final DashboardSummaryEntity _self;
  final $Res Function(DashboardSummaryEntity) _then;

/// Create a copy of DashboardSummaryEntity
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
as List<DashboardRecentTransactionEntity>,topSellingProducts: null == topSellingProducts ? _self.topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<DashboardTopProductEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardSummaryEntity].
extension DashboardSummaryEntityPatterns on DashboardSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String shopName,  double todaySales,  double salesGrowthPercent,  int lowStockCount,  double pendingLedgerAmount,  int pendingLedgerAccountsCount,  List<DashboardRecentTransactionEntity> recentTransactions,  List<DashboardTopProductEntity> topSellingProducts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String shopName,  double todaySales,  double salesGrowthPercent,  int lowStockCount,  double pendingLedgerAmount,  int pendingLedgerAccountsCount,  List<DashboardRecentTransactionEntity> recentTransactions,  List<DashboardTopProductEntity> topSellingProducts)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String shopName,  double todaySales,  double salesGrowthPercent,  int lowStockCount,  double pendingLedgerAmount,  int pendingLedgerAccountsCount,  List<DashboardRecentTransactionEntity> recentTransactions,  List<DashboardTopProductEntity> topSellingProducts)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryEntity() when $default != null:
return $default(_that.shopName,_that.todaySales,_that.salesGrowthPercent,_that.lowStockCount,_that.pendingLedgerAmount,_that.pendingLedgerAccountsCount,_that.recentTransactions,_that.topSellingProducts);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardSummaryEntity implements DashboardSummaryEntity {
  const _DashboardSummaryEntity({this.shopName = '', this.todaySales = 0, this.salesGrowthPercent = 0, this.lowStockCount = 0, this.pendingLedgerAmount = 0, this.pendingLedgerAccountsCount = 0, final  List<DashboardRecentTransactionEntity> recentTransactions = const [], final  List<DashboardTopProductEntity> topSellingProducts = const []}): _recentTransactions = recentTransactions,_topSellingProducts = topSellingProducts;
  

@override@JsonKey() final  String shopName;
@override@JsonKey() final  double todaySales;
@override@JsonKey() final  double salesGrowthPercent;
@override@JsonKey() final  int lowStockCount;
@override@JsonKey() final  double pendingLedgerAmount;
@override@JsonKey() final  int pendingLedgerAccountsCount;
 final  List<DashboardRecentTransactionEntity> _recentTransactions;
@override@JsonKey() List<DashboardRecentTransactionEntity> get recentTransactions {
  if (_recentTransactions is EqualUnmodifiableListView) return _recentTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentTransactions);
}

 final  List<DashboardTopProductEntity> _topSellingProducts;
@override@JsonKey() List<DashboardTopProductEntity> get topSellingProducts {
  if (_topSellingProducts is EqualUnmodifiableListView) return _topSellingProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSellingProducts);
}


/// Create a copy of DashboardSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryEntityCopyWith<_DashboardSummaryEntity> get copyWith => __$DashboardSummaryEntityCopyWithImpl<_DashboardSummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummaryEntity&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.todaySales, todaySales) || other.todaySales == todaySales)&&(identical(other.salesGrowthPercent, salesGrowthPercent) || other.salesGrowthPercent == salesGrowthPercent)&&(identical(other.lowStockCount, lowStockCount) || other.lowStockCount == lowStockCount)&&(identical(other.pendingLedgerAmount, pendingLedgerAmount) || other.pendingLedgerAmount == pendingLedgerAmount)&&(identical(other.pendingLedgerAccountsCount, pendingLedgerAccountsCount) || other.pendingLedgerAccountsCount == pendingLedgerAccountsCount)&&const DeepCollectionEquality().equals(other._recentTransactions, _recentTransactions)&&const DeepCollectionEquality().equals(other._topSellingProducts, _topSellingProducts));
}


@override
int get hashCode => Object.hash(runtimeType,shopName,todaySales,salesGrowthPercent,lowStockCount,pendingLedgerAmount,pendingLedgerAccountsCount,const DeepCollectionEquality().hash(_recentTransactions),const DeepCollectionEquality().hash(_topSellingProducts));

@override
String toString() {
  return 'DashboardSummaryEntity(shopName: $shopName, todaySales: $todaySales, salesGrowthPercent: $salesGrowthPercent, lowStockCount: $lowStockCount, pendingLedgerAmount: $pendingLedgerAmount, pendingLedgerAccountsCount: $pendingLedgerAccountsCount, recentTransactions: $recentTransactions, topSellingProducts: $topSellingProducts)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryEntityCopyWith<$Res> implements $DashboardSummaryEntityCopyWith<$Res> {
  factory _$DashboardSummaryEntityCopyWith(_DashboardSummaryEntity value, $Res Function(_DashboardSummaryEntity) _then) = __$DashboardSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 String shopName, double todaySales, double salesGrowthPercent, int lowStockCount, double pendingLedgerAmount, int pendingLedgerAccountsCount, List<DashboardRecentTransactionEntity> recentTransactions, List<DashboardTopProductEntity> topSellingProducts
});




}
/// @nodoc
class __$DashboardSummaryEntityCopyWithImpl<$Res>
    implements _$DashboardSummaryEntityCopyWith<$Res> {
  __$DashboardSummaryEntityCopyWithImpl(this._self, this._then);

  final _DashboardSummaryEntity _self;
  final $Res Function(_DashboardSummaryEntity) _then;

/// Create a copy of DashboardSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shopName = null,Object? todaySales = null,Object? salesGrowthPercent = null,Object? lowStockCount = null,Object? pendingLedgerAmount = null,Object? pendingLedgerAccountsCount = null,Object? recentTransactions = null,Object? topSellingProducts = null,}) {
  return _then(_DashboardSummaryEntity(
shopName: null == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String,todaySales: null == todaySales ? _self.todaySales : todaySales // ignore: cast_nullable_to_non_nullable
as double,salesGrowthPercent: null == salesGrowthPercent ? _self.salesGrowthPercent : salesGrowthPercent // ignore: cast_nullable_to_non_nullable
as double,lowStockCount: null == lowStockCount ? _self.lowStockCount : lowStockCount // ignore: cast_nullable_to_non_nullable
as int,pendingLedgerAmount: null == pendingLedgerAmount ? _self.pendingLedgerAmount : pendingLedgerAmount // ignore: cast_nullable_to_non_nullable
as double,pendingLedgerAccountsCount: null == pendingLedgerAccountsCount ? _self.pendingLedgerAccountsCount : pendingLedgerAccountsCount // ignore: cast_nullable_to_non_nullable
as int,recentTransactions: null == recentTransactions ? _self._recentTransactions : recentTransactions // ignore: cast_nullable_to_non_nullable
as List<DashboardRecentTransactionEntity>,topSellingProducts: null == topSellingProducts ? _self._topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<DashboardTopProductEntity>,
  ));
}


}

// dart format on
