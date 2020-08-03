import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class FullMovieDetailsCard extends StatelessWidget {
  const FullMovieDetailsCard({
    this.movie,
    Key key,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width - 30;
    return Container(
      height: 200,
      width: containerWidth,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
      ),
    );
  }
}
