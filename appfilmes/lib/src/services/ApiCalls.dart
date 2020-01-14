import 'dart:convert';
import 'package:appfilmes/src/models/movie.dart';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  
  static String url = 'omdbapi.com';
  
  static String apiKey = 'd12b4be8';

  static Future<Tuple2> searchFilme(busca, {int page = 1}) {
    var uri = Uri.http(ApiCalls.url, '', {
      'apikey': ApiCalls.apiKey,
      's': busca,
      'type': 'movie',
      'page': page.toString(),
    });
    return http.get(uri).then((response) {
      final parsed = jsonDecode(response.body);
      if(parsed.containsKey('Error')) {
        throw parsed['Error'];
      }
      return ApiCalls.parseMovies(response.body);
    });
  }

  static Tuple2<List<Movie>,int> parseMovies(String responseBody) {
    final parsed = jsonDecode(responseBody);
    final movies = List<Movie>.from(parsed['Search'].map((json) => Movie.fromJson(json)));

    return Tuple2<List<Movie>,int>(movies,int.parse(parsed['totalResults']));
  }

  static Future<Movie> searchById(String id) {
    var uri = Uri.http(ApiCalls.url, '', {
      'apikey': ApiCalls.apiKey,
      'i': id,
    });
    return http.get(uri).then((response) {
      final parsed = jsonDecode(response.body);
      if(parsed.containsKey('Error')) {
        throw parsed['Error'];
      }
      return ApiCalls.parseMovie(response.body);
    });
  }

  static Movie parseMovie(String responseBody) {
    final parsed = jsonDecode(responseBody);

    return Movie.fromJsonFull(parsed);
  }

}