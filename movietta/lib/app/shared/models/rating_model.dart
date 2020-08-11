import 'package:flutter/material.dart';
import 'package:movietta/app/shared/models/rating_domain_enum.dart';
import 'package:movietta/app/utils/image_loader.dart';

class RatingModel {
  String name;
  RaterDomain raterDomain;
  Image logo;
  String value;
  Widget valueBackground;

  RatingModel.fromJson(Map<String, dynamic> json) {
    this.name = json['Source'];

    this.raterDomain = this.name == 'Internet Movie Database'
        ? RaterDomain.IMDB
        : this.name == 'Rotten Tomatoes'
            ? RaterDomain.ROTTEN
            : RaterDomain.METACRITIC;

    this.logo = this.raterDomain == RaterDomain.IMDB
        ? ImageLoader.fromAsset('imdb')
        : this.raterDomain == RaterDomain.ROTTEN
            ? ImageLoader.fromAsset('rotten-tomatoes')
            : ImageLoader.fromAsset('metacritic');

    this.value = json['Value'];

    this.valueBackground = this.raterDomain == RaterDomain.IMDB
        ? ImageLoader.fromAsset('imdb-star')
        : basedOnRating(this.raterDomain, this.value);

    this.value = (this.raterDomain == RaterDomain.IMDB ||
            this.raterDomain == RaterDomain.METACRITIC)
        ? this.value.substring(0, this.value.indexOf('/'))
        : this.value;
  }

  Widget basedOnRating(RaterDomain raterDomain, String value) {
    Widget basedOnRatingBackground;
    var intValue = 0;
    if (raterDomain == RaterDomain.ROTTEN) {
      //https://www.rottentomatoes.com/about
      intValue = int.parse(this.value.substring(0, this.value.indexOf('%')));
      basedOnRatingBackground = (intValue >= 0 && intValue < 60)
          ? ImageLoader.fromAsset('rotten')
          : (intValue >= 60 && intValue < 75)
              ? ImageLoader.fromAsset('fresh')
              : ImageLoader.fromAsset('certified-fresh');
    } else {
      //https://www.metacritic.com/about-metascores
      intValue = int.parse(this.value.substring(0, this.value.indexOf('/')));
      var color = Colors.red;
      color = (intValue >= 0 && intValue < 40)
          ? Colors.red
          : (intValue >= 40 && intValue < 61) ? Colors.yellow : Colors.green;
      basedOnRatingBackground = new Container(
        color: color,
      );
    }
    return basedOnRatingBackground;
  }
}
