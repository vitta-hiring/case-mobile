import 'package:movie_app/app/delegates/search/search_controller.dart';
import 'package:movie_app/app/services/api/helper/local_storage_service.dart';
import 'package:movie_app/app/services/api/omdb_api_service.dart';
import 'package:movie_app/app/app_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/app/app_widget.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SearchController()),
        Bloc((i) => AppController()),
      ];

  @override
  List<Dependency> get dependencies => [Dependency((i) => OmdbApiService())];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
