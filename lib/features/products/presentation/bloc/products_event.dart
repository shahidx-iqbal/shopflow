import 'package:equatable/equatable.dart';
import '../../domain/entities/product_entity.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
  @override
  List<Object?> get props => [];
}

class ProductsLoadEvent extends ProductsEvent {
  const ProductsLoadEvent({this.query});
  final String? query;
  @override
  List<Object?> get props => [query];
}

class ProductsAddEvent extends ProductsEvent {
  const ProductsAddEvent({required this.product});
  final ProductEntity product;
  @override
  List<Object?> get props => [product];
}

class ProductsUpdateEvent extends ProductsEvent {
  const ProductsUpdateEvent({required this.product});
  final ProductEntity product;
  @override
  List<Object?> get props => [product];
}

class ProductsDeleteEvent extends ProductsEvent {
  const ProductsDeleteEvent({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}

class ProductsDeactivateEvent extends ProductsEvent {
  const ProductsDeactivateEvent({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}

class ProductsLoadDetailsEvent extends ProductsEvent {
  const ProductsLoadDetailsEvent({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}

class ProductsClearPriceWarningEvent extends ProductsEvent {
  const ProductsClearPriceWarningEvent();
}
