import 'package:flutter/material.dart';
import 'package:movies/components/additional_movie_info.dart';
import 'package:movies/components/movie_plot_info.dart';
import 'package:movies/components/movie_poster.dart';
import 'package:movies/components/movie_ratings_info.dart';
import 'package:movies/models/movie.dart';

class FullMovieDetailsCard extends StatelessWidget {
  const FullMovieDetailsCard({
    this.movie,
    Key key,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width - 30;
    return Container(
      width: containerWidth,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(12, 12, 12, 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                MoviePoster(posterUrl: movie.posterUrl),
                Container(
                  width: containerWidth - 125,
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: MovieRatingsInfo(movie: movie),
                ),
              ],
            ),
            MoviePlotInfo(plot: movie.plot),
            AdditionalMovieInfo(movie: movie),
          ],
        ),
      ),
    );
  }
}
