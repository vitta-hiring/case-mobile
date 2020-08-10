import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/components/after_credits_dialog/after_credits_dialog.dart';
import '../../../../shared/models/movie_model.dart';
import '../../movie_search_controller.dart';
import '../movie_info_dialog.dart';

class CarousselItem extends StatelessWidget {
  final MovieSearchController controller;
  final MovieModel item;
  final double itemHeight;

  const CarousselItem({
    Key key,
    @required this.controller,
    @required this.item,
    @required this.itemHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: item.poster,
      imageBuilder: (context, provider) {
        return InkWell(
          onTap: () async {
            await controller.doSearchMovieById(id: controller.store.movieOnScreen.imdbId);
            return AfterCreditsDialog.showMovieInfo(
              child: MovieInfoDialog(
                selectedMovie: controller.store.selectedMovie,
              ),
            );
          },
          child: Container(
            height: itemHeight,
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.white),
            ),
            child: Image(image: provider, fit: BoxFit.fitHeight),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return InkWell(
          onTap: () async {
            await controller.doSearchMovieById(id: controller.store.movieOnScreen.imdbId);
            return AfterCreditsDialog.showMovieInfo(
              child: MovieInfoDialog(selectedMovie: controller.store.selectedMovie),
            );
          },
          child: Container(
              height: itemHeight,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.white),
              ),
              child: Image.asset("assets/empty_movie.png")),
        );
      },
    );
  }
}
