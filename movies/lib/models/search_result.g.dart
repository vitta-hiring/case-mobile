// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return SearchResult()
    ..result = (json['Search'] as List)
        ?.map((e) =>
            e == null ? null : MovieSummary.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..success = SearchResult.responseSuccessFromJson(json['Response']);
}

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'Search': instance.result,
      'Response': instance.success,
    };
