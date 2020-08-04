// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSummary _$MovieSummaryFromJson(Map<String, dynamic> json) {
  return MovieSummary()
    ..title = json['Title'] as String
    ..year = json['Year'] as String
    ..imdbId = json['imdbID'] as String
    ..type = json['Type'] as String
    ..posterUrl = json['Poster'] as String;
}

Map<String, dynamic> _$MovieSummaryToJson(MovieSummary instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbId,
      'Type': instance.type,
      'Poster': instance.posterUrl,
    };
