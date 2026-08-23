import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../repositories/pos_repository.dart';

/// Looks up a product by barcode during POS checkout.
@injectable
class PosGetProductByBarcodeUseCase
    implements UseCase<ProductEntity, PosBarcodeParams> {
  PosGetProductByBarcodeUseCase(this._repository);
  final PosRepository _repository;
  @override
  Future<Either<Failure, ProductEntity>> call(PosBarcodeParams params) =>
      _repository.getProductByBarcode(params.barcode);
}
class PosBarcodeParams extends Equatable {
  const PosBarcodeParams({required this.barcode});
  final String barcode;
  @override
  List<Object?> get props => [barcode];
}
