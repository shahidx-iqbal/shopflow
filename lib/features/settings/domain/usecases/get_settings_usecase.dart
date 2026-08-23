import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/app_settings_entity.dart';
import '../repositories/settings_repository.dart';

/// Loads current application settings.
@injectable
class GetSettingsUseCase implements UseCase<AppSettingsEntity, NoParams> {
  GetSettingsUseCase(this._repository);
  final SettingsRepository _repository;
  @override
  Future<Either<Failure, AppSettingsEntity>> call(NoParams params) =>
      _repository.getSettings();
}
