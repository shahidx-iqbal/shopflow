import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/customer_type.dart';

part 'customer_entity.freezed.dart';

/// Saved customer — cash customers cannot carry ledger credit.
@freezed
abstract class CustomerEntity with _$CustomerEntity {
  const factory CustomerEntity({
    required String id,
    required String name,
    required String phone,
    String? address,
    String? notes,
    @Default(CustomerType.ledger) CustomerType customerType,
    @Default(0) double balance,
    required DateTime createdAt,
  }) = _CustomerEntity;
}
