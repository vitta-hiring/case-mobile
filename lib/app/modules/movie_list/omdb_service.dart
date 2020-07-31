import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:vitta_test/app/helpers/http_helper.dart';
import 'package:vitta_test/app/models/movie_details_model.dart';
import 'package:vitta_test/app/models/movie_model.dart';
import 'package:vitta_test/app/utils/settings.dart';

const OMDB_MOVIE_SEARCH_TYPE = 'movie';
const OMDB_SERIES_SEARCH_TYPE = 'series';
const OMDB_EPISODE_SEARCH_TYPE = 'episode';

class OMDBService extends Disposable {
  final HttpHelper _http = HttpHelper(OMDB_API_URL, OMDB_API_TIMEOUT);

  Future<List<MovieModel>> _getMidiaByTitleAndType(
      String title, String searchtype) async {
    List<MovieModel> movies = [];
    Response response = await this._http.get(queryParameters: {
      's': title,
      'apikey': OMDB_API_KEY,
      'type': searchtype,
    });
    if (response.statusCode == HttpStatus.ok) {
      ((response.data['Search'] ?? []) as List)
          .forEach((movie) => movies.add(MovieModel.fromJson(movie)));
    } else if (response.statusCode == HttpStatus.unauthorized) {
      print('Invalid API key');
      throw Exception('Invalid API key');
    }
    return movies;
  }

  Future<List<MovieModel>> getMoviesByTitle(String title) async {
    return this._getMidiaByTitleAndType(title, OMDB_MOVIE_SEARCH_TYPE);
  }

  Future<List<MovieModel>> getSeriesByTitle(String title) async {
    return this._getMidiaByTitleAndType(title, OMDB_SERIES_SEARCH_TYPE);
  }

  Future<List<MovieModel>> getEpisodesByTitle(String title) async {
    return this._getMidiaByTitleAndType(title, OMDB_EPISODE_SEARCH_TYPE);
  }

  Future<MovieDetailsModel> getMidiaById(String midiaId) async {
    Response response = await this._http.get(queryParameters: {
      'i': midiaId,
      'apikey': OMDB_API_KEY,
    });
    if (response.statusCode == HttpStatus.ok &&
        response.data['Response'] == "True") {
      return MovieDetailsModel.fromJson(response.data);
    } else if (response.statusCode == HttpStatus.unauthorized) {
      print('Invalid API key');
      throw Exception('Invalid API key');
    }
    return null;
  }

  //dispose will be called automatically
  @override
  void dispose() {
    this._http.dispose();
  }
}
