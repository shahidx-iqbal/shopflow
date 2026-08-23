import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../sales_history/domain/repositories/sales_history_repository.dart';

/// Counts sales that include a product — gates hard delete.
@injectable
class GetProductSalesCountUseCase
    implements UseCase<int, GetProductSalesCountParams> {
  GetProductSalesCountUseCase(this._salesHistoryRepository);

  final SalesHistoryRepository _salesHistoryRepository;

  @override
  Future<Either<Failure, int>> call(GetProductSalesCountParams params) async {
    final result = await _salesHistoryRepository.getSales();
    return result.fold(
      Left.new,
      (sales) {
        final count = sales
            .where(
              (sale) => sale.items.any(
                (item) => item.productId == params.productId,
              ),
            )
            .length;
        return Right(count);
      },
    );
  }
}

class GetProductSalesCountParams extends Equatable {
  const GetProductSalesCountParams({required this.productId});

  final String productId;

  @override
  List<Object?> get props => [productId];
}
