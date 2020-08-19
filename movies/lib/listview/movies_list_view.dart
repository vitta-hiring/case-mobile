import 'package:flutter/material.dart';
import 'package:movies/components/card_movie.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/views/movie_details.dart';
import 'package:movies/services/movie.dart';
import 'package:movies/utils/nav.dart';

class MoviesListView extends StatelessWidget {
  final List<Movie> movies;
  final bool search;
  const MoviesListView(this.movies, {this.search = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return InkWell(
          onTap: () {
            _onClickMovie(context, movie);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: CardMovie(movie: movie),
            ),
          ),
        );
      },
    );
  }

  _onClickMovie(BuildContext context, Movie movie) async {
      final movieInfo = await MovieService.getMovieById(movie.imdbId);
      push(context, MovieDetails(movie: movieInfo));
  }
}
