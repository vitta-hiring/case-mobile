import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/app/models/movie_detail_model.dart';
import 'package:movie_app/app/models/movie_model.dart';

//const API_KEY = "d12b4be8";
const API_KEY = "3d7685d1ab0b86cb81eb94a4978d3153";

int _page = 1;
int _maxPage = 1;
String _strSearched;

class OmdbApiService extends Disposable {
  Future<List<MovieModel>> topPopularity() async {
    http.Response response = await http.get(
        "http://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&language=pt-BR&api_key=$API_KEY");

    return decode(response);
  }

  Future<List<MovieModel>> searchVideos(String search) async {
    http.Response response = await http.get(
        "https://api.themoviedb.org/3/search/movie?api_key=$API_KEY&language=pt-BR&query=$search&page=1&include_adult=false");
    _strSearched = search;
    return decode(response);
  }

  Future<List<MovieModel>> nextPageVideos() async {
    _page++;

    if (_page > _maxPage) {
      return null;
    } else {
      http.Response response = await http.get(
          "https://api.themoviedb.org/3/search/movie?api_key=$API_KEY&language=pt-BR&query=$_strSearched&page=$_page&include_adult=false");

      return decode(response);
    }
  }

  Future<MovieDetailModel> getDetailMovie(int id) async {
    http.Response response = await http.get(
        "https://api.themoviedb.org/3/movie/$id?api_key=$API_KEY&language=pt-BR");
    var temp = decodeDetail(response);
    return temp;
  }

  List<MovieModel> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      _page = decoded["page"];
      _maxPage = decoded["total_pages"];
      List<MovieModel> movies = decoded["results"].map<MovieModel>((map) {
        return MovieModel.fromJson(map);
      }).toList();

      return movies;
    } else {
      throw Exception("Falha ao buscar os filmes");
    }
  }

  MovieDetailModel decodeDetail(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      var temp0001 = MovieDetailModel.fromJson(decoded);
      return temp0001;
    } else {
      throw Exception("Falha ao buscar os filmes");
    }
  }

  @override
  void dispose() {}
}
