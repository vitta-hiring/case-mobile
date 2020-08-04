import 'package:flutter/material.dart';
import 'package:movies/components/default_image.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    @required this.posterUrl,
    Key key,
  }) : super(key: key);
  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return posterUrl == "N/A"
        ? DefaultImage()
        : Image.network(
            posterUrl,
            height: 150,
            width: 100,
            fit: BoxFit.fitHeight,
          );
  }
}
