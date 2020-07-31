import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String font;
  final Color color;
  final bool centered;
  final TextAlign align;
  final double size;
  final double spacing;

  const CustomText(
      {Key key,
      this.text,
      this.color,
      this.centered,
      this.size,
      this.font,
      this.spacing,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: align,
        style: TextStyle(
          color: color == null ? Colors.white : color,
          fontSize: size == null ? 20 : size,
          fontFamily: font == null ? 'PoopinsRegular' : font,
          letterSpacing: spacing == null ? 0 : 1.0,
        ),
      );
}
