import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesio/core/error/failure.dart';

//! Callable Class
abstract class BaseUseCase<T, parameters> {
  Future<Either<Failure, T>> call(parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
