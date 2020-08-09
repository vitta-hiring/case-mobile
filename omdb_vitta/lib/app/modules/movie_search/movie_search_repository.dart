import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/models/movie_model.dart';
import '../../shared/services/custom_dio.dart';
import 'models/movie_search_response_model.dart';

class MovieSearchRepository extends Disposable {
  final CustomDio _httpProvider;

  MovieSearchRepository(this._httpProvider);

  Future<MovieSearchResponseModel> searchMovie({String movieName, String type, int page}) async {
    try {
      print("nome do filme pesquisado: ${movieName}");
      var response = await _httpProvider
          .get("", queryParameters: {"apikey": "d12b4be8", "s": "$movieName", "type": "$type", "page": "$page"});

      var _finalResponse = MovieSearchResponseModel.fromJson(response.data);
      return _finalResponse;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }

  Future<MovieModel> searchMovieById({String id}) async {
    print(id);
    try {
      var response = await _httpProvider.get("", queryParameters: {"apikey": "d12b4be8", "i": "$id"});

      var _finalResponse = MovieModel.fromJson(response.data);
      return _finalResponse;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }

  @override
  void dispose() {}
}
