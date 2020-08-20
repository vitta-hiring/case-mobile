import 'package:flutter/material.dart';
import 'package:movies/components/section.dart';
import 'package:movies/listview/movies_list_view.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/movie.dart';

class VerticalItems extends StatefulWidget {

  @override
  _VerticalItemsState createState() => _VerticalItemsState();
}

class _VerticalItemsState extends State<VerticalItems> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Section(
          sectionTitle: 'Lista de filmes',
          loading: _loading,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: FutureBuilder<List<Movie>>(
              future: _loadMovies(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text("Não foi possivel carregar os filmes."));
                } else if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final List<Movie> movies = snapshot.data;
                  return MoviesListView(movies, search: false);
                }
              }),
        ),
      ],
    );
  }

  Future _loadMovies() {
    return MovieService.getMovies();
  }
}
