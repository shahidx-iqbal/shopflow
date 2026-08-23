import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../repositories/sales_history_repository.dart';

/// Fetches a single sale/invoice by id.
@injectable
class GetSaleByIdUseCase implements UseCase<SaleEntity, GetSaleByIdParams> {
  GetSaleByIdUseCase(this._repository);
  final SalesHistoryRepository _repository;
  @override
  Future<Either<Failure, SaleEntity>> call(GetSaleByIdParams params) =>
      _repository.getSaleById(params.id);
}
class GetSaleByIdParams extends Equatable {
  const GetSaleByIdParams({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}
