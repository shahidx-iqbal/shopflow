import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/app_settings_entity.dart';
import '../repositories/settings_repository.dart';

/// Persists updated application settings.
@injectable
class UpdateSettingsUseCase
    implements UseCase<AppSettingsEntity, AppSettingsEntity> {
  UpdateSettingsUseCase(this._repository);
  final SettingsRepository _repository;
  @override
  Future<Either<Failure, AppSettingsEntity>> call(AppSettingsEntity params) =>
      _repository.updateSettings(params);
}
