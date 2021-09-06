import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnbdemo/domain/entities/movie.dart';

import 'movie_detail_cubit.dart';
import 'movie_detail_state.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MovieDetailCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Details')),
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Hero(
                          tag: 'poster-${movie.id}',
                          child: CachedNetworkImage(
                            imageUrl: movie.imgUrl,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 24.0),
                              child: Text(
                                movie.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0),
                              ),
                            ),
                            RichText(
                              key: Key('release-date'),
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Release Date: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: '${movie.releaseDate}'),
                                ],
                              ),
                            ),
                            RichText(
                              key: Key('ratings-count'),
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Ratings Count: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: '${movie.ratingCount}'),
                                ],
                              ),
                            ),
                            RichText(
                              key: Key('avg-rating'),
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Avg Rating: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: '${movie.avgRating}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Text(
                      movie.overview,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
