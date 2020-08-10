import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/models/movie_model.dart';

class CarousselItemTitle extends StatelessWidget {
  final MovieModel item;
  final double widthTitleText;

  const CarousselItemTitle({
    Key key,
    @required this.item,
    @required this.widthTitleText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthTitleText,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          item.title,
          style: GoogleFonts.pangolin(
            color: Color(0xff5f0380),
            fontSize: 20,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
