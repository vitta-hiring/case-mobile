import 'package:flutter/material.dart';
import '../../core/consts/consts_colors.dart';

class ThemeLight {
  ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Google',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ConstsColors.primaryColor,
      buttonColor: ConstsColors.blueLight,
      buttonTheme: ButtonThemeData(
        height: 50,
        minWidth: double.infinity,
        buttonColor: ConstsColors.blueLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
