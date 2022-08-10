class ApiConstance {
  static const apiKey = 'ea6f5ff8bd509f885f322a22590cd3df';

  static const baseUrl = 'https://api.themoviedb.org/3';

  static const nowPlayingEndPoint =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const popularEndPoint = '$baseUrl/movie/popular?api_key=$apiKey';

  static const topRatedEndPoint = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  static String movieDetailsUrl(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationsUrl(int movieId) =>
      '$baseUrl/movie/$movieId/similar?api_key=$apiKey';
}
