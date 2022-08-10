import 'package:dio/dio.dart';
import 'package:moviesio/core/error/exceptions.dart';
import 'package:moviesio/core/network/api_constance.dart';
import 'package:moviesio/core/network/error_message_model.dart';
import 'package:moviesio/movie/data/models/movie_details_model.dart';
import 'package:moviesio/movie/data/models/movie_model.dart';
import 'package:moviesio/movie/data/models/recommendation_model.dart';
import 'package:moviesio/movie/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:moviesio/movie/domain/usecases/get_movie_detail_usecase.dart';

//* Contract
abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationMoviesParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingEndPoint);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (movie) => MovieModel.fromJson(movie),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularEndPoint);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (movie) => MovieModel.fromJson(movie),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedEndPoint);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (movie) => MovieModel.fromJson(movie),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsUrl(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(
    RecommendationMoviesParameters parameters,
  ) async {
    final response =
        await Dio().get(ApiConstance.recommendationsUrl(parameters.movieId));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (recommendedMovie) => RecommendationModel.fromJson(recommendedMovie),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
