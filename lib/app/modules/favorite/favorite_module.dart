import 'package:movie_app/app/modules/favorite/favorite_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FavoriteModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => FavoriteController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<FavoriteModule>.of();
}
