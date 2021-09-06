import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hnbdemo/data/imdb_movie_repo.dart';

@immutable
class Movie extends Equatable {
  final int id;
  final String name;
  final String releaseDate;
  final String avgRating;
  final int ratingCount;
  final String overview;
  final String imgUrl;

  const Movie({
    required this.id,
    required this.name,
    required this.releaseDate,
    required this.avgRating,
    required this.ratingCount,
    required this.overview,
    required this.imgUrl,
  });

  @override
  String toString() {
    return 'Movie{' +
        ' id: $id,' +
        ' name: $name,' +
        ' releaseDate: $releaseDate,' +
        ' avgRating: $avgRating,' +
        ' ratingCount: $ratingCount,' +
        ' overview: $overview,' +
        ' imgUrl: $imgUrl,' +
        '}';
  }

  Movie copyWith({
    int? id,
    String? name,
    String? releaseDate,
    String? avgRating,
    int? ratingCount,
    String? overview,
    String? imgUrl,
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      releaseDate: releaseDate ?? this.releaseDate,
      avgRating: avgRating ?? this.avgRating,
      ratingCount: ratingCount ?? this.ratingCount,
      overview: overview ?? this.overview,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'releaseDate': this.releaseDate,
      'avgRating': this.avgRating,
      'ratingCount': this.ratingCount,
      'overview': this.overview,
      'imgUrl': this.imgUrl,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      name: map['original_title'] as String,
      releaseDate: map['release_date'] as String,
      avgRating: '${map['vote_average']}',
      ratingCount: map['vote_count'] as int,
      overview: map['overview'] as String,
      imgUrl: '${ImdbMovieRepo.BASE_MOVIE_URL}${map['poster_path'] as String}',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        releaseDate,
        avgRating,
        ratingCount,
        overview,
        imgUrl,
      ];
}
