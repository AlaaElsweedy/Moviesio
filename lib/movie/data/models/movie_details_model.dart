import 'package:moviesio/movie/data/models/genres_model.dart';
import 'package:moviesio/movie/domain/entities/genres.dart';
import 'package:moviesio/movie/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required bool adult,
    required String backdropPath,
    required List<Genres> genres,
    required int id,
    required String overview,
    required String releaseDate,
    required int runtime,
    required String title,
    required double voteAverage,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genres: genres,
          id: id,
          overview: overview,
          releaseDate: releaseDate,
          runtime: runtime,
          title: title,
          voteAverage: voteAverage,
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genres: List<GenresModel>.from(
          json['genres'].map((x) => GenresModel.fromJson(x))),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
