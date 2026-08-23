import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../customers/domain/entities/customer_entity.dart';
import '../entities/ledger_entry_entity.dart';
import '../entities/ledger_statement_entity.dart';

/// Contract for customer ledger operations.
abstract class LedgerRepository {
  Future<Either<Failure, List<CustomerEntity>>> getLedgerCustomers();
  Future<Either<Failure, LedgerStatementEntity>> getStatement(String customerId);
  Future<Either<Failure, LedgerEntryEntity>> recordPayment({
    required String customerId,
    required double amount,
    String? notes,
  });
}
