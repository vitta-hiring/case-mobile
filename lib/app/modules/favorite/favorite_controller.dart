import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:movie_app/app/models/movie_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_controller.g.dart';

class FavoriteController = _FavoriteBase with _$FavoriteController;

abstract class _FavoriteBase with Store {
  Map<String, MovieModel> _favorites = {};

  final _favController = BehaviorSubject<Map<String, MovieModel>>();
  Stream<Map<String, MovieModel>> get outFav => _favController.stream;

  _FavoriteBase(){
    SharedPreferences.getInstance().then((prefs){
      if(prefs.getKeys().contains("favorites")) {
        _favorites = json.decode(prefs.getString("favorites")).map((k, v) {
          return MapEntry(k, MovieModel.fromJson(v));
        }).cast<String, MovieModel>();

        _favController.add(_favorites);
      }
    });
  }

  void toggleFavorite(MovieModel video){
    if(_favorites.containsKey(video.id.toString())) _favorites.remove(video.id.toString());
    else _favorites[video.id.toString()] = video;

    _favController.sink.add(_favorites);

    _saveFav();
  }

  void _saveFav(){
    SharedPreferences.getInstance().then((prefs){
      prefs.setString("favorites", json.encode(_favorites));
    });
  }

  @override
  void dispose() {
    _favController.close();
  }
}
