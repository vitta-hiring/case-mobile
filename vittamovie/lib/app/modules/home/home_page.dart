import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vittamovie/app/modules/home/widgets/movie_list_view.dart';
import 'package:vittamovie/app/modules/home/widgets/search_movie.dart';
import 'package:vittamovie/app/shared/utils/SizeContants.dart';
import 'package:vittamovie/app/shared/utils/TextContants.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Movies"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: SafeArea(
            child: Column(
          children: <Widget>[
            SizedBox(height: 16),
            SearchMovie(onSubmitted: _search),
            SizedBox(height: 16),
            getBody()
          ],
        )),
      );
    });
  }

  void _search(String term) {
    controller.findByTerm(term);
  }

  Widget getBody() {
    if (controller.movies == null) {
      return Center(child: Column(children: <Widget>[
      Image(image: AssetImage('assets/images/logo.png'), height: 100,width: 100,),
        Text(TextConstants.searchByMovieName,style: TextStyle(color: Colors.grey,fontSize: SizeContants.textTitleSize),)
      ],));
    } else if (controller.movies.error != null) {
      return Center(
          child: Text(TextConstants.errorSearchMovie,style: TextStyle(color: Colors.redAccent),
      ));
    }
    if (controller.movies.value == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return MovieListView(key : widget.key,movies: controller.movies.value);
    }
  }
}
