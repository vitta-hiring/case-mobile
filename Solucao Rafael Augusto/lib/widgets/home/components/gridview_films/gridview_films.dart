import 'package:VittaChallenge/models/film.dart';
import 'package:VittaChallenge/widgets/home/components/gridview_films/item_gridview_film.dart';
import 'package:flutter/material.dart';

class GridViewFilms extends StatelessWidget {
  final List<Film> films;
  GridViewFilms({Key key, this.films}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          width: double.infinity,
          child: GridView.builder(
            itemCount: films.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (_, index) => ItemGridViewFilm(
              film: films[index],
            ),
          ),
        ),
      );
}
