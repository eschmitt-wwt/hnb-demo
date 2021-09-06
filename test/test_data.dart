import 'package:hnbdemo/domain/entities/movie.dart';

class TestData {
  static Movie movie({
    int id = 2,
    String name = 'test movie',
    String releaseDate = '2020-02-07',
    String avgRating = '2.3',
    int ratingCount = 7,
    String overview = 'testing overview',
    String imgUrl = 'https://fake.com/img.png',
  }) =>
      Movie(
          id: id,
          name: name,
          releaseDate: releaseDate,
          avgRating: avgRating,
          ratingCount: ratingCount,
          overview: overview,
          imgUrl: imgUrl);
}
