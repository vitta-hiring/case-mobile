import 'package:flutter/material.dart';
import 'package:movie_app/app/modules/home/home_module.dart';
import 'package:movie_app/app/services/api/helper/hex_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: HexColor('01d277'),
      ),
      home: HomeModule(),
    );
  }
}
