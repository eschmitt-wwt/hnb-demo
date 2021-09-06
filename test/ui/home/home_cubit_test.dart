import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hnbdemo/domain/usecases/get_movies_usecase.dart';
import 'package:hnbdemo/ui/home/home_cubit.dart';
import 'package:hnbdemo/ui/home/home_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_data.dart';
import 'home_cubit_test.mocks.dart';

late GetMovies mockGetMovies;
late HomeCubit testObject;

@GenerateMocks([GetMovies])
void main() {
  setUp(() {
    mockGetMovies = MockGetMovies();
  });

  group('HomeCubit', () {
    test('start with empty array of movies', () {
      when(mockGetMovies.get()).thenAnswer((_) => Future.value([]));

      testObject = HomeCubit(mockGetMovies);

      expect(testObject.state, HomeState(movies: []));
    });

    blocTest(
      'should update with movies',
      build: () {
        when(mockGetMovies.get())
            .thenAnswer((_) => Future.value(List.of([TestData.movie()])));
        return HomeCubit(mockGetMovies);
      },
      expect: () => <HomeState>[
        HomeState(movies: List.of([TestData.movie()]))
      ],
    );
  });
}
