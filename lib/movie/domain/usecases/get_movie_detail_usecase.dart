import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:moviesio/core/error/failure.dart';
import 'package:moviesio/core/usecase/base_usecase.dart';
import 'package:moviesio/movie/domain/entities/movie_detail.dart';
import 'package:moviesio/movie/domain/repository/base_movie_repository.dart';

class GetMovieDetailUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailUseCase(
    this.baseMovieRepository,
  );

  @override
  Future<Either<Failure, MovieDetail>> call(
    MovieDetailsParameters parameters,
  ) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
