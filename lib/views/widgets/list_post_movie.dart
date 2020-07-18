import 'package:flutter/material.dart';

class ListPosterMovie extends StatefulWidget {
  final int currentIndex;
  final String poster;
  final String titleMovie;
  final bool isActive;

  const ListPosterMovie(
      {Key key, this.currentIndex, this.poster, this.titleMovie, this.isActive})
      : super(key: key);

  @override
  _ListPosterMovieState createState() => _ListPosterMovieState();
}

class _ListPosterMovieState extends State<ListPosterMovie> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: widget.isActive ? Offset(0, 5) : Offset(0, 20),
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              widget.poster,
              height: 40,
            ),
            Text(
              widget.titleMovie,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[400]),
            )
          ],
        ),
      ),
    );
  }
}
