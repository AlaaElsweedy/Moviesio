import 'package:dartz/dartz.dart';
import 'package:moviesio/core/error/failure.dart';
import 'package:moviesio/movie/domain/entities/movie.dart';
import 'package:moviesio/movie/domain/entities/movie_detail.dart';
import 'package:moviesio/movie/domain/entities/recommendation.dart';
import 'package:moviesio/movie/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:moviesio/movie/domain/usecases/get_movie_detail_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(
      RecommendationMoviesParameters parameters);
}
