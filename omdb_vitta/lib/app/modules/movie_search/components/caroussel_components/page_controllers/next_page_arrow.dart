import 'package:flutter/material.dart';

class NextPageArrowWidget extends StatelessWidget {
  final Function onTap;

  const NextPageArrowWidget({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
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
                child: Icon(Icons.arrow_right, size: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
