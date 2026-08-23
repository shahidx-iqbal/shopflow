import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/customer_type.dart';
import '../../domain/entities/customer_entity.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

/// JSON-serializable customer model mapping to [CustomerEntity].
@freezed
abstract class CustomerModel with _$CustomerModel {
  const CustomerModel._();

  const factory CustomerModel({
    required String id,
    required String name,
    required String phone,
    String? address,
    String? notes,
    @JsonKey(name: 'customer_type') @Default('ledger') String customerType,
    @JsonKey(includeToJson: false) @Default(0) double balance,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  factory CustomerModel.fromEntity(CustomerEntity e) => CustomerModel(
        id: e.id,
        name: e.name,
        phone: e.phone,
        address: e.address,
        notes: e.notes,
        customerType: e.customerType.name,
        balance: e.balance,
        createdAt: e.createdAt,
      );

  CustomerEntity toEntity() => CustomerEntity(
        id: id,
        name: name,
        phone: phone,
        address: address,
        notes: notes,
        customerType: CustomerType.fromString(customerType),
        balance: balance,
        createdAt: createdAt,
      );
}
