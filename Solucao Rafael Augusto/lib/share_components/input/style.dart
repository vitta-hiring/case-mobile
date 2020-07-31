import 'package:flutter/material.dart';

InputBorder borderInput({BuildContext context}) => UnderlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
    );

TextStyle textStyle({bool bold = false, BuildContext context}) => TextStyle(
      color: Theme.of(context).accentColor,
      fontFamily: 'EncodeSansLight',
      fontSize: 15,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
