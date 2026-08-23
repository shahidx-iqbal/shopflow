import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/product_repository.dart';

/// Returns whether a barcode is already assigned to another product.
@injectable
class CheckBarcodeExistsUseCase
    implements UseCase<bool, CheckBarcodeExistsParams> {
  CheckBarcodeExistsUseCase(this._repository);

  final ProductRepository _repository;

  @override
  Future<Either<Failure, bool>> call(CheckBarcodeExistsParams params) =>
      _repository.barcodeExists(
        barcode: params.barcode,
        excludeProductId: params.excludeProductId,
      );
}

class CheckBarcodeExistsParams extends Equatable {
  const CheckBarcodeExistsParams({
    required this.barcode,
    this.excludeProductId,
  });

  final String barcode;
  final String? excludeProductId;

  @override
  List<Object?> get props => [barcode, excludeProductId];
}
