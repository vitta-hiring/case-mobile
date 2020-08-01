import 'package:json_annotation/json_annotation.dart';
import 'package:movies/utils/seriazable_response.dart';

part 'movie_summary.g.dart';

@JsonSerializable()
class MovieSummary extends ISeriazableResponse<MovieSummary> {
  @JsonKey(name: 'Title')
  String title;
  @JsonKey(name: 'Year')
  String year;
  @JsonKey(name: 'imdbID')
  String imdbId;
  @JsonKey(name: 'Type')
  String type;
  @JsonKey(name: 'Poster')
  String posterUrl;
  
  MovieSummary();

  @override
  MovieSummary fromJson(Map<String, dynamic> json) =>
      MovieSummary.fromJson(json);

  factory MovieSummary.fromJson(Map<String, dynamic> json) =>
      _$MovieSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$MovieSummaryToJson(this);
}
