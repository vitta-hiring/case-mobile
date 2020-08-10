import 'package:flutter/material.dart';

class PreviousPageArrowWidget extends StatelessWidget {
  final Function onTap;

  const PreviousPageArrowWidget({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkResponse(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xcc5f0380),
                ),
                child: Icon(Icons.arrow_left, size: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
