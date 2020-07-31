import 'package:VittaChallenge/share_components/input/style.dart';
import 'package:flutter/material.dart';

Widget placeholder({String text, BuildContext context}) => Padding(
      padding: EdgeInsets.only(left: 5, top: 15),
      child: Text(
        text,
        style: textStyle(
          bold: false,
          context: context,
        ),
      ),
    );
