import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:moviesio/core/error/failure.dart';
import 'package:moviesio/core/usecase/base_usecase.dart';
import 'package:moviesio/movie/domain/entities/recommendation.dart';
import 'package:moviesio/movie/domain/repository/base_movie_repository.dart';

class GetRecommendationMoviesUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationMoviesParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationMoviesParameters parameters) async {
    return await baseMovieRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationMoviesParameters extends Equatable {
  final int movieId;
  const RecommendationMoviesParameters({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
