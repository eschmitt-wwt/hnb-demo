import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnbdemo/domain/usecases/get_movies_usecase.dart';
import 'package:hnbdemo/main.dart';
import 'package:hnbdemo/ui/home/home_state.dart';
import 'package:hnbdemo/ui/movie_preview/movie_preview.dart';

import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(getIt<GetMovies>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Awesome Movies'),
        ),
        body: Builder(
          builder: (context) => _buildPage(context),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        alignment: Alignment.topCenter,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => ListView.builder(
            itemCount: state.movies.length,
            itemBuilder: (_, index) => MoviePreview(
              state.movies[index],
              key: Key('movie-${state.movies[index].id}'),
            ),
          ),
        ),
      );
}
