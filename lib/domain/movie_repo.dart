import 'entities/movie.dart';

abstract class MovieRepo {
  Future<List<Movie>> getMovies();
}
