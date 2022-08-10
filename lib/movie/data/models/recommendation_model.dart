import 'package:moviesio/movie/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required int id,
    String? backdropPath,
  }) : super(
          id: id,
          backdropPath: backdropPath,
        );

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
    );
  }
}
