import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vittamovie/app/shared/utils/SizeContants.dart';

class AboutItem extends StatelessWidget {
  final String label;
  final String value;

  const AboutItem({Key key, @required this.label, @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(label,
              style: TextStyle(
                  fontSize: SizeContants.textSizeNormal,
                  color: Colors.white)),
          width: 100,
        ),
        Expanded(child: Container(
            child: Text(value,
                style: TextStyle(
                    fontSize:
                    SizeContants.textSizeNormal,
                    color: Colors.grey)))),
      ],
    );
  }
}