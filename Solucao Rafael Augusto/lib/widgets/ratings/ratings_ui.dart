import 'package:VittaChallenge/models/detailFilm.dart';
import 'package:VittaChallenge/share_components/custom_text/custom_text.dart';
import 'package:VittaChallenge/widgets/ratings/components/listview_ratings.dart';
import 'package:VittaChallenge/widgets/ratings/ratings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingsUi extends GetView<RatingsController> {
  final Detail detail;

  const RatingsUi({Key key, this.detail}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
            text: "AVALIAÇÃO - ${detail.title}",
            font: 'PoopinsLight',
            color: Theme.of(context).accentColor,
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListViewRatings(
          detail: detail,
        ),
      );
}
