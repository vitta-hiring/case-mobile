import 'package:flutter/material.dart';
import './src/pages/HomePage/homepage.dart';

void main() => runApp(FilmesApp());

class FilmesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataBase de Filmes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}