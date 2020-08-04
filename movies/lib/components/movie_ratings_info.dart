import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class MovieRatingsInfo extends StatelessWidget {
  const MovieRatingsInfo({
    @required this.movie,
    Key key,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: <Widget>[
            Image.asset(
              'images/imdb.png',
              width: 35,
              height: 35,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                movie.ratings[0].value,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.yellow[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Image.asset(
              'images/tomatoes.png',
              width: 35,
              height: 35,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                movie.ratings[1].value,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Image.asset(
              'images/metacritic.png',
              width: 35,
              height: 35,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                movie.ratings[2].value,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.indigo[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
