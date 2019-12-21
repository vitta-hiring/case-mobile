import 'package:movie_app/app/app_controller.dart';
import 'package:movie_app/app/app_module.dart';
import 'package:movie_app/app/modules/detail/detail_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class DetailModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DetailController(AppModule.to.get())), // injeção
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<DetailModule>.of();
}
