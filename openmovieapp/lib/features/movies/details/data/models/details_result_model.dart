import 'package:openmovieapp/features/movies/details/domain/entities/details.dart';
class DetailsResultModel extends Details{
  final String title;
  final String poster;
  final String released;
  final String plot;
  final String imdbRating;

  DetailsResultModel({this.title, this.poster, this.released, this.plot, this.imdbRating});

  factory DetailsResultModel.fromMap(Map<String, dynamic> json) {
    return DetailsResultModel(
      title: json["Title"],
      poster: json["Poster"],
      released: json["Released"],
      plot: json["Plot"],
      imdbRating: json["imdbRating"],
    );
  }
//

}