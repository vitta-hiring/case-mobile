import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../interfaces/movies_api_repository_interface.dart';
import '../models/movie_model_api.dart';
import '../models/movies_api.dart';
import '../repositories/movies_api_repository.dart';

class ListMovieController extends GetxController {
  IMoviesApiRepository repoSearchMovie = Get.put(MoviesApiRepository());
  List<Search> searchMovies;
  bool response;
  MovieModelApi movieDetails;

  Widget playerButton = Icon(Icons.play_arrow, color: Colors.white);

  void getSearchMovie(String searchtitleMovie) async {
    repoSearchMovie.searchMovies(searchtitleMovie).then((movies) {
      if (movies.response == "True") {
        searchMovies = movies.search;
        response = true;
        update();
      } else {
        response = false;
        update();
      }
    });
  }

  Future<void> getSearchIdMovie(String idMovie) async {
    if (idMovie != null) {
      movieDetails = await repoSearchMovie.getMovie(idMovie);
      update();
    }
  }

  void changePlayerButton() {
    playerButton = RichText(
      text: TextSpan(children: [
        WidgetSpan(
            child: Icon(
          Icons.play_arrow,
          color: Colors.white,
        )),
        TextSpan(text: 'Pesquisar trailer')
      ]),
    );
    update();
  }
}
