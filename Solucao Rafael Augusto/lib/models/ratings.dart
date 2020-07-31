import 'package:json_annotation/json_annotation.dart';

part 'ratings.g.dart';

@JsonSerializable()
class Ratings {
  @JsonKey(name: 'Source')
  String source;

  @JsonKey(name: 'Value')
  String value;

  Ratings();

  factory Ratings.fromJson(Map<String, dynamic> json) =>
      _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);
}
