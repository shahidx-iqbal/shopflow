import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/sale_entity.dart';
import '../entities/sale_enums.dart';
import '../repositories/pos_repository.dart';

/// Refunds a completed sale. The backend restores stock and reverses ledger.
@injectable
class RefundSaleUseCase implements UseCase<SaleEntity, RefundSaleParams> {
  RefundSaleUseCase(this._posRepository);

  final PosRepository _posRepository;

  @override
  Future<Either<Failure, SaleEntity>> call(RefundSaleParams params) async {
    final saleResult = await _posRepository.getSaleById(params.saleId);

    Failure? loadFailure;
    SaleEntity? sale;
    saleResult.fold(
      (failure) => loadFailure = failure,
      (value) => sale = value,
    );
    if (loadFailure != null) return Left(loadFailure!);
    if (sale == null) {
      return const Left(UnexpectedFailure(message: 'Sale missing after fetch'));
    }

    if (sale!.status != SaleStatus.completed) {
      return const Left(
        ValidationFailure(
          message: 'Only completed sales can be refunded',
          code: 'sale_not_refundable',
        ),
      );
    }

    return _posRepository.refundSale(
      saleId: params.saleId,
      reason: params.reason,
    );
  }
}

class RefundSaleParams extends Equatable {
  const RefundSaleParams({required this.saleId, required this.reason});

  final String saleId;
  final String reason;

  @override
  List<Object?> get props => [saleId, reason];
}
