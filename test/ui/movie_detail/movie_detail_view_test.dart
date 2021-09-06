import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hnbdemo/domain/entities/movie.dart';
import 'package:hnbdemo/ui/movie_detail/movie_detail_view.dart';

import '../../test_data.dart';

late Movie movie;

void main() {
  setUp(() {
    movie = TestData.movie();
  });

  group('MovieDetailView', () {
    testWidgets('should display details about movie',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MovieDetailPage(movie)));

      expect(find.text(movie.name), findsOneWidget);
      expect(find.byKey(Key('release-date')), findsOneWidget);
      expect(find.byKey(Key('ratings-count')), findsOneWidget);
      expect(find.byKey(Key('avg-rating')), findsOneWidget);
    });
  });
}
