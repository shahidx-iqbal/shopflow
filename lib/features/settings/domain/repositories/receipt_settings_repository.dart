import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/receipt_settings_entity.dart';

/// Contract for receipt template settings persistence.
abstract class ReceiptSettingsRepository {
  Future<Either<Failure, ReceiptSettingsEntity>> getReceiptSettings();
  Future<Either<Failure, ReceiptSettingsEntity>> updateReceiptSettings(
    ReceiptSettingsEntity settings,
  );
}
