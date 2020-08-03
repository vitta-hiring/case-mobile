// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRating _$MovieRatingFromJson(Map<String, dynamic> json) {
  return MovieRating()
    ..source = json['Source'] as String
    ..value = json['Value'] as String;
}

Map<String, dynamic> _$MovieRatingToJson(MovieRating instance) =>
    <String, dynamic>{
      'Source': instance.source,
      'Value': instance.value,
    };
