import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movietta/app/app_controller.dart';
import 'package:movietta/app/app_widget.dart';
import 'package:movietta/app/pages/detail/detail_controller.dart';
import 'package:movietta/app/pages/detail/detail_page.dart';
import 'package:movietta/app/pages/home/home_controller.dart';
import 'package:movietta/app/pages/home/home_page.dart';
import 'package:movietta/app/shared/repositories/movie_repository.dart';
import 'package:movietta/app/utils/constants.dart';
import 'package:movietta/app/widgets/movie_card_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController(i.get())),
        Bind((i) => DetailController(i.get())),
        Bind((i) => MovieRepository(i.get())),
        Bind((i) => MovieCard(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => HomePage(),
        ),
        Router(
          '/detail',
          child: (_, args) => DetailPage(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
