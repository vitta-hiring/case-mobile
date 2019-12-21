import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'movie_model.g.dart';

class MovieModel extends _MovieModel with _$MovieModel {
  MovieModel(
      {String title,
      String poster_path,
      String overview,
      String release_date,
      int id,
      bool isFavorite})
      : super(
            title: title,
            poster_path: poster_path,
            overview: overview,
            release_date: release_date,
            id: id,
            isFavorite: isFavorite);
  toJson() {
    return {
      "title": title,
      "poster_path": poster_path,
      "overview": overview,
      "release_date": release_date,
      "id": id,
      "isFavorite": isFavorite
    };
  }

  factory MovieModel.fromJson(Map json) { 
    
    return MovieModel(
        title: json["title"],
        poster_path: json["poster_path"],
        overview: json["overview"],
        release_date: json["release_date"] ?? "1900-10-10",
        id: json["id"],
        isFavorite: json["isFavorite"]);
  }
}

abstract class _MovieModel with Store {
  String title;
  String poster_path;
  String overview;
  String release_date;
  int id;

  @observable
  bool isFavorite;

  _MovieModel(
      {this.title,
      this.poster_path,
      this.overview,
      this.release_date,
      this.id,
      this.isFavorite = false});
}
