import 'package:flutter/material.dart';

class WriteTextHintWidget extends StatelessWidget {
  final String searchType;

  const WriteTextHintWidget({Key key, @required this.searchType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "👆👆",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
            ),
            TextSpan(
              text: '\n\nDigite o nome ${searchType == "movie" ? "do filme" : "da série"} ali em cima!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
