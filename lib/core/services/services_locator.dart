import 'package:get_it/get_it.dart';
import 'package:moviesio/movie/data/datasource/movie_remote_data_source.dart';
import 'package:moviesio/movie/data/repository/movie_repository.dart';
import 'package:moviesio/movie/domain/repository/base_movie_repository.dart';
import 'package:moviesio/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:moviesio/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:moviesio/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:moviesio/movie/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:moviesio/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:moviesio/movie/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:moviesio/movie/presentation/controller/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //* BLOC
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    //* USECASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMoviesUseCase(sl()));

    //* REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepository(baseMovieRemoteDataSource: sl()));

    //* DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
