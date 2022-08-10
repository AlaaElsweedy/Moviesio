import 'package:dartz/dartz.dart';
import 'package:moviesio/core/error/failure.dart';
import 'package:moviesio/core/usecase/base_usecase.dart';
import 'package:moviesio/movie/domain/entities/movie.dart';
import 'package:moviesio/movie/domain/repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
