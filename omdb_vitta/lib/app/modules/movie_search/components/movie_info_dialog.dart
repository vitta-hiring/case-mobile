import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../shared/models/movie_model.dart';

class MovieInfoDialog extends StatefulWidget {
  final MovieModel selectedMovie;

  const MovieInfoDialog({Key key, this.selectedMovie}) : super(key: key);
  @override
  _MovieInfoDialogState createState() => _MovieInfoDialogState();
}

class _MovieInfoDialogState extends State<MovieInfoDialog> {
  @override
  Widget build(BuildContext context) {
    double _widthSize = MediaQuery.of(context).size.width;
    var movie = widget.selectedMovie;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Card(
            color: Colors.grey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(movie.title),
                    subtitle: Text(movie.year),
                    leading: CachedNetworkImage(
                      imageUrl: movie.poster,
                      imageBuilder: (context, provider) {
                        return Container(
                          height: _widthSize * 1.0,
                          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
                          child: Image(image: provider, fit: BoxFit.fitHeight),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Container(
                            height: _widthSize * 1.0,
                            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
                            child: Image.asset("assets/empty_movie.png"));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text("${movie.plot}"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(children: [Text("Director: ${movie.director}")]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(children: [Text("Runtime: ${movie.runtime}")]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(children: [Text("Genre: ${movie.genre}")]),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      Transform.scale(
                        scale: 0.75,
                        child: RatingBarIndicator(
                          rating: movie.imdbRating / 2,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Text((movie.imdbRating / 2).toString()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
