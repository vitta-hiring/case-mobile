import 'package:VittaChallenge/models/ratings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detailFilm.g.dart';

@JsonSerializable()
class Detail {
  @JsonKey(name: 'Title')
  String title;

  @JsonKey(name: 'Year')
  String year;

  @JsonKey(name: 'Released')
  String released;

  @JsonKey(name: 'Runtime')
  String runtime;

  @JsonKey(name: 'Genre')
  String genre;

  @JsonKey(name: 'Director')
  String director;

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

  @JsonKey(name: 'Poster')
  String poster;

  @JsonKey(name: 'Ratings')
  List<Ratings> ratings;

  @JsonKey(name: 'Metascore')
  String metascore;

  String imdbRating;
  String imdbVotes;
  String imdbID;

  @JsonKey(name: 'Type')
  String type;

  @JsonKey(name: 'DVD')
  String dvd;

  @JsonKey(name: 'BoxOffice')
  String boxOffice;

  @JsonKey(name: 'Production')
  String production;

  @JsonKey(name: 'Website')
  String website;

  @JsonKey(name: 'Response')
  String response;

  Detail();

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
