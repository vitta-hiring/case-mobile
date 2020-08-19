import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/screens/movie_details.dart';
import 'package:movies/services/movie.dart';
import 'package:movies/utils/nav.dart';

class VerticalItem extends StatefulWidget {
  final List<Movie> movies;
  final BuildContext context;
  const VerticalItem({this.movies, this.context});

  @override
  _VerticalItemState createState() => _VerticalItemState();
}

class _VerticalItemState extends State<VerticalItem> {
  var _onLoading = false;
  @override
  Widget build(BuildContext context) {
    if (_onLoading == true) {
      return Container(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: widget.movies.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final movie = widget.movies[index];
        if (movie.poster == 'N/A') {
          movie.poster =
              'https://us.123rf.com/450wm/urfandadashov/urfandadashov1809/urfandadashov180901275/109135379-photo-not-available-vector-icon-isolated-on-transparent-background-photo-not-available-logo-concept.jpg?ver=6';
        }
        return InkWell(
          onTap: () {
            _onClickMovie(context, movie.imdbId);
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(movie.poster),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 240,
                        child: Text(movie.year,
                            maxLines: 5, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _onClickMovie(ctx, imdbId) async {
    setState(() {
      _onLoading = true;
    });
    final movieInfo = await MovieService.getMovieById(imdbId);
    push(widget.context, MovieDetails(movie: movieInfo));
    if (movieInfo != null) {
      setState(() {
        _onLoading = false;
      });
    }
  }
}
