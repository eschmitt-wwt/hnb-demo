import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hnbdemo/domain/entities/movie.dart';

@immutable
class HomeState extends Equatable {
  final List<Movie> movies;

  const HomeState({
    required this.movies,
  });

  @override
  String toString() {
    return 'HomeState{' + ' movies: $movies,' + '}';
  }

  @override
  List<Object?> get props => [movies];
}
