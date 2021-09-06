import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hnbdemo/data/imdb_movie_repo.dart';
import 'package:hnbdemo/domain/movie_repo.dart';
import 'package:hnbdemo/domain/usecases/get_movies_usecase.dart';
import 'package:hnbdemo/ui/home/home_view.dart';
import 'package:hnbdemo/ui/routes.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<http.Client>(http.Client());
  getIt.registerSingleton<MovieRepo>(ImdbMovieRepo(getIt<http.Client>()));
  getIt.registerSingleton(GetMovies(getIt<MovieRepo>()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onGenerateRoute: (settings) => Routes.generateRoutes(context, settings),
    );
  }
}
