import 'package:flutter/material.dart';

class ColorConstants{

  static const Color lightPrimary = Color(0xFF20293F);
  static const Color darkPrimary = Color(0xFF1A2035);
  static const Color lightBG = Color(0xfffcfcff);
  static const Color darkBG = Color(0xFF1A2035);
  static const Color accentColor = Colors.redAccent;
  static var opacity = Color(0xFF0E3311).withOpacity(0.5);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkPrimary,
    primaryColor: lightPrimary,
    accentColor: Colors.redAccent,
    scaffoldBackgroundColor: Colors.black,
    cursorColor: Colors.redAccent,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}