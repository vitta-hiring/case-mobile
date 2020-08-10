import 'package:openmovieapp/features/movies/search/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult{
  final String title;
  final String year;
  final String imdbID;
  final String poster;

  SearchResultModel({this.title, this.year, this.imdbID, this.poster});

  factory SearchResultModel.fromMap(Map<String, dynamic> json) {
    return SearchResultModel(
      title: json["Title"],
      year: json["Year"],
      imdbID: json["imdbID"],
      poster: json["Poster"],
    );
  }

}