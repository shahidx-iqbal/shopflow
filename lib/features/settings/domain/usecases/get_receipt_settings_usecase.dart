import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/receipt_settings_entity.dart';
import '../repositories/receipt_settings_repository.dart';

/// Loads receipt template settings.
@injectable
class GetReceiptSettingsUseCase
    implements UseCase<ReceiptSettingsEntity, NoParams> {
  GetReceiptSettingsUseCase(this._repository);

  final ReceiptSettingsRepository _repository;

  @override
  Future<Either<Failure, ReceiptSettingsEntity>> call(NoParams params) =>
      _repository.getReceiptSettings();
}
