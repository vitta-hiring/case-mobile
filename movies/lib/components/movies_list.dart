import 'package:flutter/material.dart';
import 'package:movies/components/movie_card.dart';
import 'package:movies/models/movie_summary.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    this.movies,
    Key key,
  }) : super(key: key);

  final List<MovieSummary> movies;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 140),
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(
            movie: movies[index],
          );
        },
      ),
    );
  }
}
