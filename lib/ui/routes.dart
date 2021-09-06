import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hnbdemo/domain/entities/movie.dart';
import 'package:hnbdemo/ui/movie_detail/movie_detail_view.dart';

class Routes {
  static const DETAILS = '/details';

  static Route<dynamic> generateRoutes(
      BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case DETAILS:
        {
          final Movie movie = settings.arguments as Movie;
          return MaterialPageRoute(builder: (_) => MovieDetailPage(movie));
        }
      default:
        throw Exception('You do not have this route ${settings.name}');
    }
  }
}
