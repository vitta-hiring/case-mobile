import 'package:json_annotation/json_annotation.dart';
import 'package:movies/utils/seriazable_response.dart';

part 'movie_rating.g.dart';

@JsonSerializable()
class MovieRating extends ISeriazableResponse<MovieRating> {
  @JsonKey(name: 'Source')
  String source;
  @JsonKey(name: 'Value')
  String value;

  MovieRating();

  @override
  MovieRating fromJson(Map<String, dynamic> json) => MovieRating.fromJson(json);

  factory MovieRating.fromJson(Map<String, dynamic> json) =>
      _$MovieRatingFromJson(json);

  Map<String, dynamic> toJson() => _$MovieRatingToJson(this);
}
