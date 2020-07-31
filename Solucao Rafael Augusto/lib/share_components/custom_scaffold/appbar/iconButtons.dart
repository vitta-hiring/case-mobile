import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget btnIconClose(BuildContext context) => CupertinoButton(
      child: Icon(
        Icons.close,
        color: Theme.of(context).accentColor,
        size: 28,
      ),
      onPressed: () => SystemNavigator.pop(),
    );

Widget btnIconBack(BuildContext context) => CupertinoButton(
      child: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).accentColor,
        size: 28,
      ),
      onPressed: () {},
    );
