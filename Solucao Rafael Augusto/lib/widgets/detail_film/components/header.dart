import 'dart:ui';

import 'package:VittaChallenge/models/detailFilm.dart';
import 'package:VittaChallenge/share_components/button/button_back.dart';
import 'package:VittaChallenge/share_components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import 'imageBackground.dart';

Widget infoHeader(Detail detail) => Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            child: detail.poster != 'N/A'
                ? Image.network(detail.poster)
                : Center(
                    child: CustomText(
                      text: detail.title,
                      size: 30,
                      font: "PoppinsBold",
                    ),
                  ),
          ),
        ),
        Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            detail.imdbRating != "N/A"
                ? CustomText(
                    text: "nota ${detail.imdbRating}",
                    size: 12,
                    font: "PoppinsBold",
                    color: double.parse(detail.imdbRating) >= 7
                        ? Colors.green
                        : Colors.red,
                  )
                : Container(),
            SizedBox(width: 20),
            CustomText(
              text: detail.year,
              size: 12,
            ),
            SizedBox(width: 20),
            CustomText(
              text: detail.runtime,
              size: 12,
            )
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );

Widget background(Detail detail) => Stack(
      fit: StackFit.expand,
      children: <Widget>[
        detail.poster != 'N/A'
            ? imageBackground(detail.poster)
            : imageBackground(
                'https://www.pictorem.com/collection/900_Rizwana-Khan_sunset%20Blurred%20Background.jpg'),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        infoHeader(detail)
      ],
    );

Widget header(BuildContext context, Detail detail) => SliverAppBar(
      expandedHeight: 250,
      floating: false,
      pinned: true,
      elevation: 0,
      title: CustomText(
        text: '',
        font: 'PoopinsLight',
      ),
      leading: buttonBack(context),
      centerTitle: true,
      backgroundColor: Theme.of(context).backgroundColor,
      flexibleSpace: FlexibleSpaceBar(background: background(detail)),
    );
