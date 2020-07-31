import 'package:flutter/material.dart';
import 'package:vitta_test/app/modules/movie_list/movie_list_module.dart';
import 'package:vitta_test/app/utils/settings.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MovieListModule(),
    );
  }
}
