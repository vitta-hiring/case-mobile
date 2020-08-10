import 'package:openmovieapp/features/movies/search/data/models/search_result_model.dart';

abstract class SearchDataSource{
 Future<List<SearchResultModel>> getSearch(String searchTex);
}