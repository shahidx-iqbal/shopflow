import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/receipt_settings_entity.dart';
import '../repositories/receipt_settings_repository.dart';

/// Persists receipt template settings.
@injectable
class UpdateReceiptSettingsUseCase
    implements UseCase<ReceiptSettingsEntity, UpdateReceiptSettingsParams> {
  UpdateReceiptSettingsUseCase(this._repository);

  final ReceiptSettingsRepository _repository;

  @override
  Future<Either<Failure, ReceiptSettingsEntity>> call(
    UpdateReceiptSettingsParams params,
  ) =>
      _repository.updateReceiptSettings(params.settings);
}

class UpdateReceiptSettingsParams extends Equatable {
  const UpdateReceiptSettingsParams({required this.settings});

  final ReceiptSettingsEntity settings;

  @override
  List<Object?> get props => [settings];
}
