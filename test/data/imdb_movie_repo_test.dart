import 'package:flutter_test/flutter_test.dart';
import 'package:hnbdemo/data/imdb_movie_repo.dart';
import 'package:hnbdemo/domain/entities/movie.dart';
import 'package:hnbdemo/domain/movie_repo.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'imdb_movie_repo_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  final mockClient = new MockClient();

  late MovieRepo testObject;

  setUp(() {
    reset(mockClient);
    testObject = ImdbMovieRepo(mockClient);
  });

  group('MovieRepo', () {
    test('should convert json response to Movie objects', () async {
      final response = Response(movieData, 200);
      final expected = Movie(
        name: "The Suicide Squad",
        avgRating: '8',
        releaseDate: '2021-07-28',
        id: 436969,
        imgUrl:
            '${ImdbMovieRepo.BASE_MOVIE_URL}/iXbWpCkIauBMStSTUT9v4GXvdgH.jpg',
        overview: 'Supervillains Harley Quinn',
        ratingCount: 3277,
      );

      when(mockClient.get(any)).thenAnswer((_) => Future.value(response));

      final results = await testObject.getMovies();

      expect(results[0], expected);
    });
  });
}

final movieData = '{'
    '"results": '
    '[{'
    '"id": 436969,'
    '"original_title": "The Suicide Squad",'
    '"overview": "Supervillains Harley Quinn",'
    '"poster_path": "/iXbWpCkIauBMStSTUT9v4GXvdgH.jpg",'
    '"release_date": "2021-07-28",'
    '"title": "The Suicide Squad",'
    '"vote_average": 8,'
    '"vote_count": 3277'
    '}]'
    '}';
