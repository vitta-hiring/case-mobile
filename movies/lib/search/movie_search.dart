import 'package:flutter/material.dart';
import 'package:movies/listview/movies_list_view.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/movie.dart';

class MovieSearch extends SearchDelegate<Movie>{
  @override
  String get searchFieldLabel => 'Nome do filme';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.length > 2){
      return FutureBuilder(future: MovieService.search(query),
      builder: (context, snapshot){
        if(snapshot.hasData){
          final List<Movie> movies = snapshot.data;
          return MoviesListView(movies, search: true);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      );
    }

    return Container();
  }
}