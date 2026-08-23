import '../../../pos/data/models/sale_model.dart';
import '../../../pos/domain/entities/sale_enums.dart';

abstract class SalesHistoryDataSource {
  Future<List<SaleModel>> getSales({SaleType? filter});
  Future<SaleModel> getSaleById(String id);
}
