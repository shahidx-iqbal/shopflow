import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../../../products/domain/repositories/product_repository.dart';
import '../entities/cart_item_entity.dart';
import '../entities/cart_stock_issue.dart';
import '../services/pos_cart_calculator.dart';

/// Re-validates cart stock at confirm time against live product quantities.
@injectable
class CheckCartStockAvailabilityUseCase
    implements UseCase<Unit, CheckCartStockParams> {
  CheckCartStockAvailabilityUseCase(this._productRepository);

  final ProductRepository _productRepository;

  @override
  Future<Either<Failure, Unit>> call(CheckCartStockParams params) async {
    final issues = <CartStockIssue>[];

    for (final item in params.items) {
      final productResult =
          await _productRepository.getProductById(item.productId);

      Failure? failure;
      ProductEntity? product;
      productResult.fold(
        (f) => failure = f,
        (p) => product = p,
      );
      if (failure != null) return Left(failure!);
      if (product == null) {
        return const Left(UnexpectedFailure(message: 'Product missing'));
      }

      final available = PosCartCalculator.availableStock(product!);

      if (item.quantity > available) {
        issues.add(
          CartStockIssue(
            productId: item.productId,
            productName: item.productName,
            requested: item.quantity,
            available: available,
            unit: item.unit,
          ),
        );
      }
    }

    if (issues.isNotEmpty) {
      final failure = InsufficientStockFailure(issues);
      return Left(
        ValidationFailure(message: failure.message, code: failure.code),
      );
    }

    return const Right(unit);
  }
}

class CheckCartStockParams extends Equatable {
  const CheckCartStockParams({required this.items});

  final List<CartItemEntity> items;

  @override
  List<Object?> get props => [items];
}
