import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hnbdemo/domain/usecases/get_movies_usecase.dart';
import 'package:hnbdemo/ui/home/home_view.dart';
import 'package:hnbdemo/ui/movie_preview/movie_preview.dart';
import 'package:mockito/mockito.dart';

import '../../test_data.dart';
import 'home_cubit_test.mocks.dart';

late GetMovies mockGetMovies;

void main() {
  setUp(() {
    mockGetMovies = MockGetMovies();
    GetIt.I.registerSingleton<GetMovies>(mockGetMovies);
  });

  testWidgets('HomeView', (WidgetTester tester) async {
    final movies = List.of([TestData.movie()]);
    when(mockGetMovies.get()).thenAnswer((_) => Future.value(movies));

    await tester.pumpWidget(MaterialApp(home: HomePage()));

    await tester.pump();

    expect(find.text(movies[0].name), findsOneWidget);
    expect(find.text(movies[0].overview), findsOneWidget);
    expect(find.byType(MoviePreview), findsOneWidget);
  });
}
