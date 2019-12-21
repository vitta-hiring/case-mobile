import 'package:mobx/mobx.dart';
import 'package:movie_app/app/models/genres_model.dart';

part 'movie_detail_model.g.dart';

class MovieDetailModel extends _MovieDetailModel with _$MovieDetailModel {
  MovieDetailModel({
    String title,
    String backdrop_path,
    String overview,
    String poster_path,
    double vote_average,
    String release_date,
    List<GenresModel> genres
  }) : super(
            title: title,
            backdrop_path: backdrop_path,
            overview: overview,
            poster_path: poster_path,
            vote_average: vote_average,
            release_date: release_date,
            genres: genres);
  toJson() {
    return {
      "title": title,
      "backdrop_path": backdrop_path,
      "overview": overview,
      "poster_path": poster_path,
      "vote_average": vote_average,
      "release_date": release_date,
      "genres": genres
    };
  }

  factory MovieDetailModel.fromJson(Map json) { 
    List<GenresModel> movies = json["genres"].map<GenresModel>((map) {
        return GenresModel.fromJson(map);
      }).toList();

    return MovieDetailModel(
        title: json["title"],
        backdrop_path: json["backdrop_path"],
        overview: json["overview"],
        poster_path: json["poster_path"],
        vote_average: json["vote_average"],
        release_date: json["release_date"],
        genres: movies);
  }
}

abstract class _MovieDetailModel with Store {
  String title;
  String backdrop_path;
  String overview;
  String poster_path;
  double vote_average;
  String release_date;
  List<GenresModel> genres;

  _MovieDetailModel(
      {this.title,
      this.backdrop_path,
      this.overview,
      this.poster_path,
      this.vote_average,
      this.release_date,
      this.genres});
}
