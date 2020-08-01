import 'package:json_annotation/json_annotation.dart';
import 'package:movies/models/movie_summary.dart';
import 'package:movies/utils/seriazable_response.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult extends ISeriazableResponse<SearchResult> {
  
  @JsonKey(name: 'Search')
  List<MovieSummary> result;
  
  SearchResult();

  @override
  SearchResult fromJson(Map<String, dynamic> json) =>
      SearchResult.fromJson(json);

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}