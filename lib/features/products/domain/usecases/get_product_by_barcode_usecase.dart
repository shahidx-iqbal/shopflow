import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

/// Looks up a product by barcode for POS scanning.
@injectable
class GetProductByBarcodeUseCase
    implements UseCase<ProductEntity, GetProductByBarcodeParams> {
  GetProductByBarcodeUseCase(this._repository);
  final ProductRepository _repository;

  @override
  Future<Either<Failure, ProductEntity>> call(
    GetProductByBarcodeParams params,
  ) {
    return _repository.getProductByBarcode(params.barcode);
  }
}

class GetProductByBarcodeParams extends Equatable {
  const GetProductByBarcodeParams({required this.barcode});
  final String barcode;
  @override
  List<Object?> get props => [barcode];
}
