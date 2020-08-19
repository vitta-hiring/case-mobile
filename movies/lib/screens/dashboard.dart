import 'package:flutter/material.dart';
import 'package:movies/components/vertical_items.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/search/movie_search.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/logo.png',
          height: 80,
          width: 80,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
                _onClickSearch(context);
              },
          )
        ],
      ),
      body: SingleChildScrollView(child: VerticalItems()),
    );
  }

    _onClickSearch(context) async {
    final movie = await showSearch<Movie>(
        context: context, delegate: MovieSearch());
    if (movie != null) {
      //alert(context, "Busca", movie.title);
    }
  }
}
