import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/local_storage/hive_service.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../products/data/models/product_model.dart';
import '../models/pos_cart_draft_model.dart';
import '../models/sale_model.dart';
import 'pos_datasource.dart';

@LazySingleton(as: PosDataSource)
class PosRemoteDataSource implements PosDataSource {
  PosRemoteDataSource(this._client, this._hive);

  final ApiClient _client;
  final HiveService _hive;

  static const _draftKey = 'pos_cart_draft';

  @override
  Future<SaleModel> saveSale(SaleModel sale) async {
    try {
      final payload = Map<String, dynamic>.from(sale.toJson());
      if (sale.id.isEmpty) {
        payload.remove('id');
      }
      final response = await _client.post(
        ApiEndpoints.sales,
        data: payload,
      );
      await clearCartDraft();
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        SaleModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<SaleModel> updateSale(SaleModel sale) async {
    try {
      final response = await _client.put(
        ApiEndpoints.saleById(sale.id),
        data: sale.toJson(),
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        SaleModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<SaleModel> refundSale({
    required String id,
    required String reason,
  }) async {
    try {
      final response = await _client.put(
        ApiEndpoints.saleById(id),
        data: {
          'status': 'refunded',
          'refund_reason': reason,
        },
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        SaleModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<SaleModel> getSaleById(String id) async {
    try {
      final response = await _client.get(ApiEndpoints.saleById(id));
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        SaleModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString(), code: 'sale_not_found');
    }
  }

  @override
  Future<ProductModel> getProductByBarcode(String barcode) async {
    try {
      final response = await _client.get(ApiEndpoints.productByBarcode(barcode));
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        ProductModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> saveCartDraft(PosCartDraftModel draft) async {
    await _hive.put(
      HiveService.cartBox,
      _draftKey,
      jsonEncode(draft.toJson()),
    );
  }

  @override
  Future<PosCartDraftModel?> loadCartDraft() async {
    final raw = _hive.get(HiveService.cartBox, _draftKey);
    if (raw == null) return null;
    return PosCartDraftModel.fromJson(
      jsonDecode(raw as String) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> clearCartDraft() async {
    await _hive.delete(HiveService.cartBox, _draftKey);
  }
}
