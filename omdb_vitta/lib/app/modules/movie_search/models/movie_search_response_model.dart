import 'package:meta/meta.dart';

import '../../../shared/models/movie_model.dart';

class MovieSearchResponseModel {
    MovieSearchResponseModel({
        @required this.moviesList,
        @required this.totalResults,
        @required this.response,
    });

    final List<MovieModel> moviesList;
    final int totalResults;
    final String response;

    MovieSearchResponseModel copyWith({
        List<MovieModel> moviesList,
        int totalResults,
        String response,
    }) => 
        MovieSearchResponseModel(
            moviesList: moviesList ?? this.moviesList,
            totalResults: totalResults ?? this.totalResults,
            response: response ?? this.response,
        );

    factory MovieSearchResponseModel.fromJson(Map<String, dynamic> json) => MovieSearchResponseModel(
        moviesList: json["Search"] == null ? null : List<MovieModel>.from(json["Search"].map((x) => MovieModel.fromJson(x))),
        totalResults: json["totalResults"] == null ? null : int.parse(json["totalResults"]),
        response: json["Response"] == null ? null : json["Response"],
    );

    Map<String, dynamic> toJson() => {
        "Search": moviesList == null ? null : List<dynamic>.from(moviesList.map((x) => x.toJson())),
        "totalResults": totalResults == null ? null : totalResults,
        "Response": response == null ? null : response,
    };
}
