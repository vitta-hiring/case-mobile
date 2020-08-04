import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class MovieRatingsInfo extends StatelessWidget {
  const MovieRatingsInfo({
    @required this.movie,
    Key key,
  }) : super(key: key);
  final Movie movie;

  String getImageName(String source) {
    if (source == 'Internet Movie Database') return 'images/imdb.png';

    if (source == 'Rotten Tomatoes') return 'images/tomatoes.png';

    if (source == 'Metacritic') return 'images/metacritic.png';

    return '';
  }

  Color getColor(String source) {
    if (source == 'Internet Movie Database') return Colors.yellow[800];

    if (source == 'Rotten Tomatoes') return Colors.green[700];

    if (source == 'Metacritc') return Colors.indigo[900];

    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: movie.ratings
          .map(
            (e) => Row(
              children: <Widget>[
                Image.asset(
                  getImageName(e.source),
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    e.value,
                    style: TextStyle(
                      fontSize: 24,
                      color: getColor(e.source),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
          .toList(),
    );
  }
}
