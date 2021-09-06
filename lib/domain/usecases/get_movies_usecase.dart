import 'package:hnbdemo/domain/entities/movie.dart';
import 'package:hnbdemo/domain/movie_repo.dart';

class GetMovies {
  final MovieRepo _movieRepo;

  GetMovies(this._movieRepo);

  Future<List<Movie>> get() => this._movieRepo.getMovies();
}
