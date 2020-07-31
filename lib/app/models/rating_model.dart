import 'package:vitta_test/app/utils/resources.dart';

const IMDB = 'Internet Movie Database';
const METACRITIC = 'Metacritic';
const ROTTEN_TOMATOES = 'Rotten Tomatoes';

class RatingModel {
  RatingModel({
    this.source,
    this.value,
  });

  String source;
  String value;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        source: json["Source"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Source": source,
        "Value": value,
      };

  static String getPathIcon(String name) {
    if (name == IMDB)
      return IMDB_ICON_PATH;
    else if (name == METACRITIC)
      return METACRITIC_ICON_PATH;
    else if (name == ROTTEN_TOMATOES) return ROTTEN_TOMATOES_ICON_PATH;
    return null;
  }
}
