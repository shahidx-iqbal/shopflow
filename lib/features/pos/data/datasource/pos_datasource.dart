import '../../../products/data/models/product_model.dart';
import '../models/pos_cart_draft_model.dart';
import '../models/sale_model.dart';

abstract class PosDataSource {
  Future<SaleModel> saveSale(SaleModel sale);
  Future<SaleModel> updateSale(SaleModel sale);
  Future<SaleModel> refundSale({required String id, required String reason});
  Future<SaleModel> getSaleById(String id);
  Future<ProductModel> getProductByBarcode(String barcode);
  Future<void> saveCartDraft(PosCartDraftModel draft);
  Future<PosCartDraftModel?> loadCartDraft();
  Future<void> clearCartDraft();
}
