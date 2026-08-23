import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

/// Abstract base for all application usecases.
///
/// Each usecase exposes a single [call] method returning
/// [Either]<[Failure], TResult>.
abstract class UseCase<TResult, Params> {
  Future<Either<Failure, TResult>> call(Params params);
}

/// Marker class for usecases that require no parameters.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
