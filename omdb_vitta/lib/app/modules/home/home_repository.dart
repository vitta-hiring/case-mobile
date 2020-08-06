import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/models/movie_model.dart';
import '../../shared/services/custom_dio.dart';

class HomeRepository extends Disposable {
  final CustomDio _httpProvider;

  HomeRepository(this._httpProvider);

  Future<List<MovieModel>> searchMovie(String movieName) async {
    try {
      var response = await _httpProvider.get("",queryParameters: {"apikey":"d12b4be8", "s":"$movieName", "type": "movie"});
      await Future.delayed(Duration(milliseconds: 3000));

      final _finalResponse = (response.data["Search"] as List).map((f) => MovieModel.fromJson(f)).toList();
      return _finalResponse;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }

  @override
  void dispose() {}
}
