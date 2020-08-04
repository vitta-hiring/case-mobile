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
        MovieInfoText(label: 'Duração: ', value: movie.runtime),
        MovieInfoText(label: 'Box Office: ', value: movie.boxOffice),
        MovieInfoText(label: 'Elenco: ', value: movie.actors),
        MovieInfoText(label: 'Diretor: ', value: movie.directedBy),
        MovieInfoText(label: 'Escritor: ', value: movie.writer),
        MovieInfoText(label: 'Lançamento DVD: ', value: movie.dvdReleasedAt),
        MovieInfoText(label: 'Classificação indicativa: ', value: movie.rated),
      ],
    );
  }
}

class MovieInfoText extends StatelessWidget {
  const MovieInfoText({
    @required this.label,
    @required this.value,
    Key key,
  }) : super(key: key);
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: new TextSpan(
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(
              text: label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            new TextSpan(
              text: value,
            ),
          ],
        ),
      ),
    );
  }
}
