import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/sale_entity.dart';
import '../entities/sale_enums.dart';
import '../repositories/pos_repository.dart';

/// Confirms a sale. The backend deducts stock and updates ledger balance.
@injectable
class ConfirmSaleUseCase implements UseCase<SaleEntity, SaleEntity> {
  ConfirmSaleUseCase(this._posRepository);

  final PosRepository _posRepository;

  @override
  Future<Either<Failure, SaleEntity>> call(SaleEntity sale) {
    return _posRepository.saveSale(
      sale.copyWith(status: SaleStatus.completed),
    );
  }
}
