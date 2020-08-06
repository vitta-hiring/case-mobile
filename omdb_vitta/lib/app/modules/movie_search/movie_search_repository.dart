import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/services/custom_dio.dart';
import 'models/movie_search_response_model.dart';

class MovieSearchRepository extends Disposable {
  final CustomDio _httpProvider;

  MovieSearchRepository(this._httpProvider);

  Future<MovieSearchResponseModel> searchMovie({String movieName, String type, int page}) async {
    try {
      print("nome do filme pesquisado: ${movieName}");
      var response =
          await _httpProvider.get("", queryParameters: {"apikey": "d12b4be8", "s": "$movieName", "type": "$type", "page": "$page"});

      var _finalResponse = MovieSearchResponseModel.fromJson(response.data);



      // if (data["Search"] != null) {
      //   _finalResponse = (response.data["Search"] as List).map((f) => MovieModel.fromJson(f)).toList();
      // } else {
      //   throw DioError(
      //     request: response.request,
      //     response: response,
      //     type: DioErrorType.DEFAULT,
      //     error: "Filme não encontrado",
      //   );
      // }

      return _finalResponse;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }

  @override
  void dispose() {}
}
