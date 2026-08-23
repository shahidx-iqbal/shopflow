import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/receipt_settings_entity.dart';
import '../../domain/repositories/receipt_settings_repository.dart';
import '../datasource/receipt_settings_datasource.dart';
import '../models/receipt_settings_model.dart';

@LazySingleton(as: ReceiptSettingsRepository)
class ReceiptSettingsRepositoryImpl implements ReceiptSettingsRepository {
  ReceiptSettingsRepositoryImpl(this._dataSource);

  final ReceiptSettingsDataSource _dataSource;

  @override
  Future<Either<Failure, ReceiptSettingsEntity>> getReceiptSettings() async {
    try {
      return Right((await _dataSource.getReceiptSettings()).toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReceiptSettingsEntity>> updateReceiptSettings(
    ReceiptSettingsEntity settings,
  ) async {
    try {
      final updated = await _dataSource.updateReceiptSettings(
        ReceiptSettingsModel.fromEntity(settings),
      );
      return Right(updated.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
