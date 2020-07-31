// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) {
  return Film()
    ..title = json['Title'] as String
    ..year = json['Year'] as String
    ..imdbID = json['imdbID'] as String
    ..type = json['Type'] as String
    ..poster = json['Poster'] as String;
}

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbID,
      'Type': instance.type,
      'Poster': instance.poster,
    };
