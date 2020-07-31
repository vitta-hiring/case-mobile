import 'package:VittaChallenge/models/detailFilm.dart';
import 'package:VittaChallenge/models/ratings.dart';
import 'package:VittaChallenge/share_components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class ListViewRatings extends StatelessWidget {
  final Detail detail;

  const ListViewRatings({Key key, this.detail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Ratings> ratings = List<Ratings>();

    detail.ratings.map((Ratings rating) => ratings.add(rating)).toList();

    ratings.map((Ratings rating) => print(rating.source)).toList();

    return ListView.builder(
      itemBuilder: (_, index) {
        Ratings rating = ratings[index];
        return ListTile(
          title: CustomText(
            text: rating.source,
            align: TextAlign.left,
            font: 'PoppinsBold',
          ),
          subtitle: CustomText(
            text: rating.value,
            align: TextAlign.left,
            font: 'PoppinsRegular',
          ),
        );
      },
      itemCount: ratings.length,
    );
  }
}
