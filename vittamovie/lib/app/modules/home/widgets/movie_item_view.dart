import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vittamovie/app/modules/home/model/Movie.dart';

class MovieItemView extends StatelessWidget {
  final Movie movie;

  const MovieItemView({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight -40,
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 80.0,
                      offset: new Offset(5.0, 90.0),
                    ),
                  ],
                  color: Colors.black,
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.8), BlendMode.hue),
                      image: NetworkImage(movie.poster == "N/A" ? "https://parisdayhotel.com/assets/images/tn_noimage.png" : movie.poster),
                      fit: BoxFit.cover))
              ),
              Container(
                width: constraints.maxWidth,
                height: 40,
                child: Center(child: Text(movie.title,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16, color: Colors.white))),
              )
            ],
          );
        }
    );
  }
}