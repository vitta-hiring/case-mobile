import 'package:dio/dio.dart';
import 'package:vittamovie/app/modules/home/model/Movie.dart';

class MovieRepository{

  final Dio dio;

  MovieRepository(this.dio);

  Future<List<Movie>> getMoviesByTerm(String term) async{
    try{
      Response response =
      await dio.get("?apikey=d12b4be8&type=movie&s="+ term);
      List<Movie> movies = (response.data["Search"] as List).map((item) => Movie.fromJson(item)).toList();
      return movies;
    }on Exception catch (e) {
      print(e);
    }
  }
}