import 'package:movies/models/search_result.dart';
import 'package:movies/utils/http_client.dart';

class MoviesRepository {
  HttpClient _httpClient = HttpClient(baseUrl: 'http://www.omdbapi.com');
  String _apiKey = 'd12b4be8';
  String _type = 'movie';

  Future<SearchResult> getMovies({Map<String, String> query}) async {
    try {
      query.addAll({
        'apikey': _apiKey,
        'type': _type,
      });
      SearchResult movies = await _httpClient.get<SearchResult>(
        creator: () => SearchResult(),
        query: query,
      );
      return movies;
    } catch (e) {
      throw e;
    }
  }
}
