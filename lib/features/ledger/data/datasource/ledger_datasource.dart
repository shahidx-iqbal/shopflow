import '../../../customers/data/models/customer_model.dart';
import '../models/ledger_entry_model.dart';
import '../models/ledger_statement_model.dart';

abstract class LedgerDataSource {
  Future<List<CustomerModel>> getLedgerCustomers();
  Future<LedgerStatementModel> getStatement(String customerId);
  Future<LedgerEntryModel> recordPayment({
    required String customerId,
    required double amount,
    String? notes,
  });
}
