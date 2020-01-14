import 'package:appfilmes/src/models/movie.dart';
import 'package:flutter/material.dart';

class DetalhesFilme extends StatelessWidget {

  final Movie movie;

  DetalhesFilme({@required this.movie});

  Widget build(BuildContext context) {
    return Expanded(
      flex:2,
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(10)),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 10,right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Nome',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                movie.title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                'Lançado em',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                movie.released,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                'Nota IMDb',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.star_half,
                    size: 30,
                  ),
                  Text(
                    movie.imdbRating,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
            ),
            Container(
              child: Text(
                'Gênero',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                movie.genre,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        )
      )
    );
  }
}