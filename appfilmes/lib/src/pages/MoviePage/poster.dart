import 'package:flutter/material.dart';

class Poster extends StatelessWidget {

  final String posterUrl;

  Poster({@required this.posterUrl});

  Widget build(BuildContext context) {
    return Expanded(
      flex:4,
      child: Container(
        child: posterOuPadrao(),
        margin: EdgeInsets.only(right: 10)
      ),
    );
  }

  Widget posterOuPadrao() {
    if(posterUrl=='N/A') {
      return Container(
        height: 400,
        color: Colors.black,
        child: Center(
          child: Icon(
            Icons.local_movies,
            size: 80,
            color: Colors.grey,
          ),
        ),
      );
    }
    return Image(
      image: NetworkImage(posterUrl),
      fit: BoxFit.fitWidth,
    );
  }
}