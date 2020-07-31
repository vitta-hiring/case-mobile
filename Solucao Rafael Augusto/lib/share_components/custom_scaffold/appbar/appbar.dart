import 'package:VittaChallenge/share_components/custom_scaffold/appbar/iconButtons.dart';
import 'package:VittaChallenge/share_components/custom_text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
        {context: BuildContext,
        title: String,
        iconClose: bool,
        iconback: bool}) =>
    AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: CustomText(
        text: title,
        size: 15,
        font: 'PoopinsLight',
        spacing: 1.2,
      ),
      actions: iconClose == true ? <Widget>[btnIconClose(context)] : <Widget>[],
      leading: iconback == true ? btnIconBack(context) : Container(),
    );
