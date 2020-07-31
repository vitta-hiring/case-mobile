import 'package:VittaChallenge/share_components/input/style.dart';
import 'package:flutter/material.dart';

Widget input(String placeholder, TextEditingController controller,
        Object onChange, BuildContext ctx) =>
    TextField(
      key: Key('input'),
      controller: controller,
      onChanged: onChange,
      cursorColor: Theme.of(ctx).accentColor,
      cursorWidth: 4,
      autofocus: true,
      style: textStyle(context: ctx),
      decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(color: Theme.of(ctx).accentColor),
          enabledBorder: borderInput(context: ctx),
          focusedBorder: borderInput(context: ctx)),
    );
