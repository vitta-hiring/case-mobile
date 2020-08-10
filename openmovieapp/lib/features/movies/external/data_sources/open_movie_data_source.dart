import 'package:dio/dio.dart';
import 'package:openmovieapp/features/movies/details/data/data_source/details_data_source.dart';
import 'package:openmovieapp/features/movies/details/data/models/details_result_model.dart';
import 'package:openmovieapp/features/movies/search/data/data_source/search_data_source.dart';
import 'package:openmovieapp/features/movies/search/data/models/search_result_model.dart';

class OpenMovieDataSource implements SearchDataSource,DetailsDataSource{
  final Dio dio;

  OpenMovieDataSource(this.dio);
  @override
  Future<List<SearchResultModel>> getSearch(String searchTex) async {
    Response response = await dio
        .get('http://www.omdbapi.com?apikey=d12b4be8&s=$searchTex&type=movie');
    if (response.statusCode == 200) {
      final list = (response.data['Search'] as List)
          .map((e) => SearchResultModel.fromMap(e))
          .toList();
      return list;
    }
  }

  @override
  Future<DetailsResultModel> getDetails(String id) async {
    Response response = await dio
        .get('http://www.omdbapi.com?apikey=d12b4be8&i=$id');
    if (response.statusCode == 200) {
      final result = DetailsResultModel.fromMap(response.data);
      return result;
    }else{
      return null;
    }

  }
}
