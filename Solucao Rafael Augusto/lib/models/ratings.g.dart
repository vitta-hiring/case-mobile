// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratings _$RatingsFromJson(Map<String, dynamic> json) {
  return Ratings()
    ..source = json['Source'] as String
    ..value = json['Value'] as String;
}

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'Source': instance.source,
      'Value': instance.value,
    };
