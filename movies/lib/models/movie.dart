// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

class Movie {
    Movie({
        this.title,
        this.year,
        this.imdbId,
        this.type,
        this.poster,
    });

    String title;
    String year;
    String imdbId;
    Type type;
    String poster;

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: typeValues.map[json["Type"]],
        poster: json["Poster"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": typeValues.reverse[type],
        "Poster": poster,
    };
}

enum Type { MOVIE, SERIES, GAME }

final typeValues = EnumValues({
    "game": Type.GAME,
    "movie": Type.MOVIE,
    "series": Type.SERIES
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
