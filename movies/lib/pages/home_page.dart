import 'package:flutter/material.dart';
import 'package:movies/components/home_page_layout.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Busque por seus filmes favoritos!'),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: HomePageLayout(),
    );
  }
}