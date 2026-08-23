import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/app_settings_entity.dart';

/// Contract for reading and updating app settings.
abstract class SettingsRepository {
  Future<Either<Failure, AppSettingsEntity>> getSettings();
  Future<Either<Failure, AppSettingsEntity>> updateSettings(AppSettingsEntity settings);
}
