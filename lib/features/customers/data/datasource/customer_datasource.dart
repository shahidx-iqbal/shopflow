import '../models/customer_model.dart';

abstract class CustomerDataSource {
  Future<List<CustomerModel>> getCustomers({String? query});
  Future<CustomerModel> getCustomerById(String id);
  Future<CustomerModel> createCustomer(CustomerModel customer);
  Future<CustomerModel> updateCustomer(CustomerModel customer);
  Future<void> deleteCustomer(String id);
}
