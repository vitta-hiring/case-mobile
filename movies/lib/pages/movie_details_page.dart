import 'package:flutter/material.dart';
import 'package:movies/components/error_card.dart';
import 'package:movies/components/full_movie_details_card.dart';
import 'package:movies/components/loading_indicator.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatelessWidget {
  static const routeName = '/movie-details';
  const MovieDetailsPage({Key key}) : super(key: key);
  Widget getMainContent(BuildContext context, MoviesProvider provider) {
    switch (provider.movieDetailsPageState) {
      case MovieDetailsPageState.Result:
        return FullMovieDetailsCard(
          movie: provider.selectedMovie,
        );
        break;
      case MovieDetailsPageState.Loading:
        return LoadingIndicator();
        break;
      default:
        return ErroCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context, provider, _) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text(provider.selectedMovie?.title ?? ''),
              Text(
                provider.selectedMovie?.year ?? '',
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
          child: getMainContent(context, provider),
        ),
      ),
    );
  }
}
