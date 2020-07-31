import 'package:VittaChallenge/models/detailFilm.dart';
import 'package:VittaChallenge/share_components/button/button.dart';
import 'package:VittaChallenge/share_components/custom_text/custom_text.dart';
import 'package:VittaChallenge/widgets/detail_film/components/gridview_details/gridview_detail.dart';
import 'package:VittaChallenge/widgets/ratings/ratings_binding.dart';
import 'package:VittaChallenge/widgets/ratings/ratings_ui.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buttonGoToRatings(Detail detail) => detail.ratings.length >= 2
    ? Padding(
        padding: EdgeInsets.all(10),
        child: CustomButton(
            title: 'Visualizar avaliações',
            onClick: () => Get.to(
                RatingsUi(
                  key: Key('ratingUi'),
                  detail: detail,
                ),
                binding: RatingsBinding(),
                transition: Transition.fade)),
      )
    : Container();

Widget detailBody(Detail detail) => Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buttonGoToRatings(detail),
          CustomText(
            text: detail.plot,
            color: Colors.white,
            size: 14,
            font: 'EncodeSansRegular',
            align: TextAlign.left,
          ),
          SizedBox(height: 20),
          detail.actors != "N/A"
              ? CustomText(
                  text: "Elenco: ${detail.actors}",
                  color: Color(0xffCDCBCB),
                  size: 12,
                  font: 'EncodeSansRegular',
                  align: TextAlign.left,
                )
              : Container(),
          SizedBox(height: 5),
          detail.production != "N/A"
              ? CustomText(
                  text: "Produzido por: ${detail.production}",
                  color: Color(0xffCDCBCB),
                  size: 12,
                  font: 'EncodeSansRegular',
                  align: TextAlign.left,
                )
              : Container(),
          SizedBox(height: 5),
          detail.director != "N/A"
              ? CustomText(
                  text: "Direção: ${detail.director}",
                  color: Color(0xffCDCBCB),
                  size: 12,
                  font: 'EncodeSansRegular',
                  align: TextAlign.left,
                )
              : Container(),
          SizedBox(height: 5),
          detail.writer != "N/A"
              ? CustomText(
                  text: "Editora: ${detail.writer}",
                  color: Color(0xffCDCBCB),
                  size: 12,
                  font: 'EncodeSansRegular',
                  align: TextAlign.center,
                )
              : Container(),
          SizedBox(height: 20),
          GridViewDetails(
            detail: detail,
          ),
        ],
      ),
    );
