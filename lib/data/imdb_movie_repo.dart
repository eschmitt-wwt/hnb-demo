import 'dart:convert' as convert;

import 'package:hnbdemo/domain/entities/movie.dart';
import 'package:hnbdemo/domain/movie_repo.dart';
import 'package:http/http.dart';

class ImdbMovieRepo extends MovieRepo {
  static const BASE_MOVIE_URL = 'https://image.tmdb.org/t/p/w500';

  final Client _client;

  ImdbMovieRepo(this._client);

  @override
  Future<List<Movie>> getMovies() async {
    final url = Uri.https('api.themoviedb.org', '/3/movie/popular', {
      'api_key': '943cdb7eff679d755548c207d027494b',
      'language': 'en-US',
      'page': '1'
    });
    final response = await _client.get(url);
    final jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    final res = jsonResponse['results'] as List<dynamic>;
    return res.map<Movie>((value) => Movie.fromMap(value)).toList();
  }
}
