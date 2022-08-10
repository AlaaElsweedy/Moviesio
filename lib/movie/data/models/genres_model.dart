import 'package:moviesio/movie/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
