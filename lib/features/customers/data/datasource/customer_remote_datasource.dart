import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../models/customer_model.dart';
import 'customer_datasource.dart';

@LazySingleton(as: CustomerDataSource)
class CustomerRemoteDataSource implements CustomerDataSource {
  CustomerRemoteDataSource(this._client);

  final ApiClient _client;

  @override
  Future<List<CustomerModel>> getCustomers({String? query}) async {
    try {
      final response = await _client.get(
        ApiEndpoints.customers,
        queryParameters: query != null ? {'q': query} : null,
      );
      return parseApiListData(
        response.data as Map<String, dynamic>,
        CustomerModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<CustomerModel> getCustomerById(String id) async {
    try {
      final response = await _client.get(ApiEndpoints.customerById(id));
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        CustomerModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<CustomerModel> createCustomer(CustomerModel customer) async {
    try {
      final response = await _client.post(
        ApiEndpoints.customers,
        data: customer.toJson(),
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        CustomerModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<CustomerModel> updateCustomer(CustomerModel customer) async {
    try {
      final response = await _client.put(
        ApiEndpoints.customerById(customer.id),
        data: customer.toJson(),
      );
      return parseApiObjectData(
        response.data as Map<String, dynamic>,
        CustomerModel.fromJson,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteCustomer(String id) async {
    try {
      await _client.delete(ApiEndpoints.customerById(id));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
