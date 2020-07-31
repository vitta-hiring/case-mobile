import 'package:VittaChallenge/common/assets.dart';
import 'package:VittaChallenge/share_components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class HomeIntro extends StatelessWidget {
  HomeIntro({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(
              text: "BUSCA DE FILMES",
              font: 'PoppinsBold',
              centered: true,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image(
                image: image('intro.png'),
              ),
            )
          ],
        ),
      );
}
