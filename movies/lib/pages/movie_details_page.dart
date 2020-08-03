import 'package:flutter/material.dart';
import 'package:movies/components/full_movie_details_card.dart';
import 'package:movies/models/movie.dart';

class MovieDetailsPage extends StatelessWidget {
  static const routeName = '/movie-details';
  const MovieDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context).settings.arguments as Movie;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(movie.title),
            Text(
              movie.year,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: FullMovieDetailsCard(
          movie: movie,
        ),
      ),
    );
  }
}
