import 'package:flutter/cupertino.dart';

Widget imageBackground(String image) => Image.network(
      image,
      filterQuality: FilterQuality.low,
      fit: BoxFit.cover,
      scale: 1,
    );
