import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesio/core/utils/enums.dart';
import 'package:moviesio/movie/domain/entities/movie_detail.dart';
import 'package:moviesio/movie/domain/entities/recommendation.dart';
import 'package:moviesio/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:moviesio/movie/domain/usecases/get_recommendation_movies_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  MovieDetailsBloc(
      this.getMovieDetailUseCase, this.getRecommendationMoviesUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationsEvent>(_getRecommendationMovies);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailUseCase(
        MovieDetailsParameters(movieId: event.movieId));

    result.fold((l) {
      emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        movieDetailsState: RequestState.success,
        movieDetail: r,
      ));
    });
  }

  FutureOr<void> _getRecommendationMovies(
      GetRecommendationsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationMoviesUseCase
        .call(RecommendationMoviesParameters(movieId: event.movieId));

    result.fold((l) {
      emit(state.copyWith(
        recommendationsState: RequestState.error,
        recommendationsMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        recommendationsState: RequestState.success,
        recommendations: r,
      ));
    });
  }
}
