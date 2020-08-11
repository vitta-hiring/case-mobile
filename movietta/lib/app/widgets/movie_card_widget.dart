import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movietta/app/pages/detail/detail_controller.dart';
import 'package:movietta/app/shared/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  MovieModel movieModel;

  final detailController = Modular.get<DetailController>();

  MovieCard(this.movieModel);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            Image.network(
              movieModel.poster,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Flexible(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text(
                      movieModel.title,
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 25,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          detailController.imdbId = movieModel.imdbId;
          Modular.to.pushNamed('/detail');
        },
      ),
    );
  }
}
