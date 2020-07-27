import 'package:dio/dio.dart';
import 'package:vittamovie/app/modules/detail/model/MovieDetail.dart';

class MovieDetailRepository{

  final Dio dio;

  MovieDetailRepository(this.dio);

  Future<MovieDetail> getMovieById(String id) async{
    try{
      Response response =
      await dio.get("?apikey=d12b4be8&i="+ id);
      MovieDetail movieDetail = MovieDetail.fromJson(response.data);
      return movieDetail;
    }on Exception catch (e) {
      print(e);
    }
  }
}