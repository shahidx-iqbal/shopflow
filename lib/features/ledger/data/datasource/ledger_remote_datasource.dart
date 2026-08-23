import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../../customers/data/models/customer_model.dart';
import '../models/ledger_entry_model.dart';
import '../models/ledger_statement_model.dart';
import 'ledger_datasource.dart';

@LazySingleton(as: LedgerDataSource)
class LedgerRemoteDataSource implements LedgerDataSource {
  LedgerRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<List<CustomerModel>> getLedgerCustomers() async {
    try {
      final response = await _client.get(ApiEndpoints.ledger);
      return parseApiListData(
        response.data as Map<String, dynamic>,
        CustomerModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<LedgerStatementModel> getStatement(String customerId) async {
    try {
      final response =
          await _client.get(ApiEndpoints.ledgerStatement(customerId));
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        LedgerStatementModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<LedgerEntryModel> recordPayment({
    required String customerId,
    required double amount,
    String? notes,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.recordPayment,
        data: {
          'customer_id': customerId,
          'amount': amount,
          'notes': notes,
        },
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        LedgerEntryModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
