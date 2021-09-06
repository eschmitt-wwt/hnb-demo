import 'package:flutter_test/flutter_test.dart';
import 'package:hnbdemo/domain/movie_repo.dart';
import 'package:hnbdemo/domain/usecases/get_movies_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_movies_usecase_test.mocks.dart';

@GenerateMocks([MovieRepo])
void main() {
  group('GetMovies', () {
    test('Should all movie repo getMovies', () async {
      final mockMovieRepo = MockMovieRepo();
      when(mockMovieRepo.getMovies()).thenAnswer((_) => Future.value([]));

      final testObject = GetMovies(mockMovieRepo);

      await testObject.get();

      verify(mockMovieRepo.getMovies());
    });
  });
}
