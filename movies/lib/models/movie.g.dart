// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie()
    ..title = json['Title'] as String
    ..year = json['Year'] as String
    ..rated = json['Rated'] as String
    ..releasedAt = json['Released'] as String
    ..runtime = json['Runtime'] as String
    ..genre = json['Genre'] as String
    ..directedBy = json['Director'] as String
    ..writer = json['Writer'] as String
    ..actors = json['Actors'] as String
    ..plot = json['Plot'] as String
    ..language = json['Language'] as String
    ..country = json['Country'] as String
    ..awards = json['Awards'] as String
    ..dvdReleasedAt = json['DVD'] as String
    ..boxOffice = json['BoxOffice'] as String
    ..producedBy = json['Production'] as String
    ..ratings = (json['Ratings'] as List)
        ?.map((e) =>
            e == null ? null : MovieRating.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..website = json['Website'] as String
    ..imdbId = json['imdbID'] as String
    ..type = json['Type'] as String
    ..posterUrl = json['Poster'] as String
    ..success = Movie.responseSuccessFromJson(json['Response']);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Rated': instance.rated,
      'Released': instance.releasedAt,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.directedBy,
      'Writer': instance.writer,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Language': instance.language,
      'Country': instance.country,
      'Awards': instance.awards,
      'DVD': instance.dvdReleasedAt,
      'BoxOffice': instance.boxOffice,
      'Production': instance.producedBy,
      'Ratings': instance.ratings,
      'Website': instance.website,
      'imdbID': instance.imdbId,
      'Type': instance.type,
      'Poster': instance.posterUrl,
      'Response': instance.success,
    };
