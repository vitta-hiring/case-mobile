import 'package:json_annotation/json_annotation.dart';
import 'package:movies/models/movie_rating.dart';
import 'package:movies/utils/seriazable_response.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends ISeriazableResponse<Movie> {
  @JsonKey(name: 'Title')
  String title;
  @JsonKey(name: 'Year')
  String year;
  @JsonKey(name: 'Rated')
  String rated;
  @JsonKey(name: 'Released')
  String releasedAt;
  @JsonKey(name: 'Runtime')
  String runtime;
  @JsonKey(name: 'Genre')
  String genre;
  @JsonKey(name: 'Director')
  String directedBy;
  @JsonKey(name: 'Writer')
  String writer;
  @JsonKey(name: 'Actors')
  String actors;
  @JsonKey(name: 'Plot')
  String plot;
  @JsonKey(name: 'Language')
  String language;
  @JsonKey(name: 'Country')
  String country;
  @JsonKey(name: 'Awards')
  String awards;
  @JsonKey(name: 'DVD')
  String dvdReleasedAt;
  @JsonKey(name: 'BoxOffice')
  String boxOffice;
  @JsonKey(name: 'Production')
  String producedBy;
  @JsonKey(name: 'Ratings')
  List<MovieRating> ragings;
  @JsonKey(name: 'Website')
  String website;
  @JsonKey(name: 'imdbID')
  String imdbId;
  @JsonKey(name: 'Type')
  String type;
  @JsonKey(name: 'Poster')
  String posterUrl;
  @JsonKey(name: 'Response', fromJson: responseSuccessFromJson)
  bool success;

  Movie();

  static bool responseSuccessFromJson(value) {
    return value == 'True';
  }

  @override
  Movie fromJson(Map<String, dynamic> json) => Movie.fromJson(json);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
