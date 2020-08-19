import 'package:flutter/material.dart';
import 'package:movies/components/card_movie.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/views/movie_details.dart';
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
      return CircularProgressIndicator();
    } else {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
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
            child: CardMovie(movie: movie),
          );
        },
      );
    }
  }

  _onClickMovie(ctx, imdbId) async {
    setState(() {
      _onLoading = true;
    });
    final movieInfo = await MovieService.getMovieById(imdbId);
    push(widget.context, MovieDetails(movie: movieInfo));
    setState(() {
      _onLoading = false;
    });
  }
}
