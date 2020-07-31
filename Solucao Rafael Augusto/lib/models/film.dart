import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable()
class Film {
  @JsonKey(name: 'Title')
  String title;
  @JsonKey(name: 'Year')
  String year;
  String imdbID;
  @JsonKey(name: 'Type')
  String type;
  @JsonKey(name: 'Poster')
  String poster;

  Film();

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);

  Map<String, dynamic> toJson() => _$FilmToJson(this);
}
