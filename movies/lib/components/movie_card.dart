import 'package:flutter/material.dart';
import 'package:movies/components/default_image.dart';
import 'package:movies/models/movie_summary.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    this.movie,
    Key key,
  }) : super(key: key);
  final MovieSummary movie;

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width - 30;
    return Container(
      height: 200,
      width: containerWidth,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          movie.posterUrl == "N/A"
              ? DefaultImage()
              : Image.network(
                  movie.posterUrl,
                  height: 150,
                  width: 100,
                  fit: BoxFit.fitHeight,
                ),
          Container(
            width: containerWidth - 125,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      movie.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Ano: ${movie.year}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: containerWidth - 125,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () => null,
                    child: Text(
                      'VER MAIS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
