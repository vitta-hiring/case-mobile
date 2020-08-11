import 'package:movietta/app/shared/models/rating_model.dart';

class MovieModel {
  String imdbId;
  String title;
  String poster;
  String year;
  String type;
  String plot;
  String runtime;
  String director;
  String genre;
  String released;
  String actors;
  String imdbRating;
  List<RatingModel> ratings;

  MovieModel.fromJson(Map<String, dynamic> json) {
    imdbId = json['imdbID'];
    title = json['Title'];
    poster = json['Poster'];
    year = json['Year'];
    type = json['Type'];
    plot = json['Plot'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    released = json['Released'];
    actors = json['Actors'];
    director = json['Director'];
    imdbRating = json['imdbRating'];
    if (json['Ratings'] != null) {
      ratings = [];
      for (var rating in (json['Ratings'] as List)) {
        RatingModel ratingModel = RatingModel.fromJson(rating);
        this.ratings.add(ratingModel);
      }
    }
  }
}
