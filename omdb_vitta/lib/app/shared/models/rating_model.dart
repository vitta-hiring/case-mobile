import 'package:meta/meta.dart';

class RatingModel {
    RatingModel({
        @required this.source,
        @required this.value,
    });

    final String source;
    final String value;

    RatingModel copyWith({
        String source,
        String value,
    }) => 
        RatingModel(
            source: source ?? this.source,
            value: value ?? this.value,
        );

    factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        source: json["Source"] == null ? null : json["Source"],
        value: json["Value"] == null ? null : json["Value"],
    );

    Map<String, dynamic> toJson() => {
        "Source": source == null ? null : source,
        "Value": value == null ? null : value,
    };
}
