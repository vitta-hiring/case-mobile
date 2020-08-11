import 'package:dio/dio.dart';
import 'package:movietta/app/shared/models/movie_model.dart';

class MovieRepository {
  final Dio dio;

  MovieRepository(this.dio);

  Future<List<MovieModel>> searchMoviesByTitle(String title) async {
    var response = await dio.get('&s=$title');
    List<MovieModel> movies = [];
    for (var json in (response.data['Search'] as List)) {
      MovieModel movieModel = MovieModel.fromJson(json);
      movies.add(movieModel);
    }
    return movies;
  }

  Future<MovieModel> getMovieByImdbId(String imdbId) async {
    var response = await dio.get('&i=$imdbId');
    MovieModel movieModel = MovieModel.fromJson(response.data);
    return movieModel;
  }
}
