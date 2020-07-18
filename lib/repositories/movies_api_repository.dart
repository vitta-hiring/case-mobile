import 'dart:convert';
import 'package:test_app/core/consts/consts_url_base.dart';
import 'package:http/http.dart' as http;
import '../interfaces/movies_api_repository_interface.dart';
import '../models/movie_model_api.dart';
import '../models/movies_api.dart';

class MoviesApiRepository implements IMoviesApiRepository {
  @override
  Future<MoviesApi> searchMovies(String titleMovie) async {
    try {
      var res = await http.get(ConstsUrlBase.urlSearchMovie + titleMovie);
      return MoviesApi.fromJson(json.decode(res.body));
    } on Exception catch (e) {
      print('Error, $e');
      return null;
    }
  }

  @override
  Future<MovieModelApi> getMovie(String idMovie) async {
    try {
      var res = await http.get(ConstsUrlBase.urlSeachIdMovie + idMovie);
      return MovieModelApi.fromJson(json.decode(res.body));
    } on Exception catch (e) {
      print('Error, $e');
      return null;
    }
  }
}
