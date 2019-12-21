import 'package:flutter/material.dart';
import 'package:movie_app/app/models/movie_detail_model.dart';
import 'package:movie_app/app/models/movie_model.dart';
import 'package:movie_app/app/modules/detail/detail_page.dart';
import 'package:movie_app/app/modules/favorite/favorite_controller.dart';
import 'package:movie_app/app/modules/home/components/movie_tile/movie_tile_widget.dart';
import 'package:movie_app/app/modules/home/home_controller.dart';
import 'package:movie_app/app/modules/home/home_module.dart';

class FavoritePage extends StatefulWidget {
  final String title;
  const FavoritePage({Key key, this.title = "Favorite"}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final bloc = FavoriteController();
  final controller = HomeModule.to.bloc<HomeController>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, MovieModel>>(
        stream: bloc.outFav,
          initialData: {},
          builder: (context, snapshot){
            return ListView(
              children: snapshot.data.values.map((v){
                return MovieTileWidget(model: v,onPressed: (){goToDetails(v.id);});}).toList(),
            );
          }
      );
  }
  Future<void> goToDetails(int id) async {
    MovieDetailModel movieDetail = await controller.listMovie(id);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(model: movieDetail)),
    );
  }
}
