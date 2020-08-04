import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class AdditionalMovieInfo extends StatelessWidget {
  const AdditionalMovieInfo({
    @required this.movie,
    Key key,
  }) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            'Duração: ${movie.runtime}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            'Box Office: ${movie.boxOffice}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            'Elenco: ${movie.actors}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            'Diretor: ${movie.directedBy}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            'Escritor: ${movie.writer}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            'Produtor: ${movie.producedBy}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            'Classificação indicativa: ${movie.rated}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
