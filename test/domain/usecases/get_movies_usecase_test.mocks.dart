// Mocks generated by Mockito 5.0.15 from annotations
// in hnbdemo/test/domain/usecases/get_movies_usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:hnbdemo/domain/entities/movie.dart' as _i4;
import 'package:hnbdemo/domain/movie_repo.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [MovieRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepo extends _i1.Mock implements _i2.MovieRepo {
  MockMovieRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Movie>> getMovies() =>
      (super.noSuchMethod(Invocation.method(#getMovies, []),
              returnValue: Future<List<_i4.Movie>>.value(<_i4.Movie>[]))
          as _i3.Future<List<_i4.Movie>>);
  @override
  String toString() => super.toString();
}