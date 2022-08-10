part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent(this.movieId);
}

class GetRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetRecommendationsEvent(this.movieId);
}
