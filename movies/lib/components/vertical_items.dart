import 'package:flutter/material.dart';
import 'package:movies/components/section.dart';
import 'package:movies/components/vertical_item.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/movie.dart';

class VerticalItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Section(
          sectionTitle: 'Lista de filmes',
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FutureBuilder<List<Movie>>(
              future: MovieService.getMovies(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text("Não foi possivel carregar os filmes."));
                } else if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return VerticalItem(context: context, movies: snapshot.data);
                }
              }),
        )
      ],
    );
  }
}
