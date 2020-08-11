import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteText extends StatelessWidget {
  final double fontSize;
  final String text;

  const WhiteText({Key key, this.fontSize, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        color: Colors.white,
        fontSize: fontSize,
      ),
    );
  }
}
