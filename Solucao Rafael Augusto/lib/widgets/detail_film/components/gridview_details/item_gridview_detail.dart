import 'package:VittaChallenge/share_components/custom_text/custom_text.dart';

import 'package:flutter/material.dart';

class ItemGridViewDetail extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String info;

  const ItemGridViewDetail({Key key, this.iconData, this.info, this.title})
      : super(key: key);

  Widget icon(IconData icon) => Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      );

  Widget titleInfo(String title) => Center(
        child: CustomText(
          color: Color(0xffCDCBCB),
          text: title,
          font: 'PoppinsBold',
          size: 13,
          align: TextAlign.center,
        ),
      );

  Widget text(String text) => Center(
        child: CustomText(
          color: Color(0xffCDCBCB),
          text: text,
          font: 'PoopinsRegular',
          size: 12,
          align: TextAlign.center,
        ),
      );

  @override
  Widget build(BuildContext context) => Card(
        elevation: 2,
        shadowColor: Colors.black,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon(iconData),
            SizedBox(
              height: 2,
            ),
            titleInfo(title),
            SizedBox(
              height: 2,
            ),
            text(info)
          ],
        ),
      );
}
