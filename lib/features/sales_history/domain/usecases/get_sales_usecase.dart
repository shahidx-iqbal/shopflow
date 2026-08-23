import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../pos/domain/entities/sale_entity.dart';
import '../../../pos/domain/entities/sale_enums.dart';
import '../repositories/sales_history_repository.dart';

/// Fetches sales history, optionally filtered by [SaleType].
@injectable
class GetSalesUseCase implements UseCase<List<SaleEntity>, GetSalesParams> {
  GetSalesUseCase(this._repository);
  final SalesHistoryRepository _repository;
  @override
  Future<Either<Failure, List<SaleEntity>>> call(GetSalesParams params) =>
      _repository.getSales(filter: params.filter);
}
class GetSalesParams extends Equatable {
  const GetSalesParams({this.filter});
  final SaleType? filter;
  @override
  List<Object?> get props => [filter];
}
