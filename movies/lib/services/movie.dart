import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/models/movie.dart';
import 'package:movies/models/movie_info.dart';

class MovieService {  
  static Future<List<Movie>> getMovies() async {
    final url = 'http://www.omdbapi.com?apikey=d12b4be8&s=Rambo';
    final response = await http.get(url);
    final mapMovies = json.decode(response.body)['Search']; 
    final movies = mapMovies.map<Movie>((json) => Movie.fromJson(json)).toList();
    return movies;    
  }

  static Future<MovieInfo> getMovieById(imdbId) async {
    final url = 'http://www.omdbapi.com?apikey=d12b4be8&i='+imdbId;
    final response = await http.get(url);
    final mapMovies = json.decode(response.body); 
    final movieDetail = MovieInfo.fromJson(mapMovies);
    return movieDetail;
  }
}