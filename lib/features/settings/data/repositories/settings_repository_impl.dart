import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/app_settings_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasource/settings_datasource.dart';
import '../models/app_settings_model.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._dataSource);

  final SettingsDataSource _dataSource;

  @override
  Future<Either<Failure, AppSettingsEntity>> getSettings() async {
    try {
      return Right((await _dataSource.getSettings()).toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AppSettingsEntity>> updateSettings(
    AppSettingsEntity settings,
  ) async {
    try {
      final updated = await _dataSource.updateSettings(
        AppSettingsModel.fromEntity(settings),
      );
      return Right(updated.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
