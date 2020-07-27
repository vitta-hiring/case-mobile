import 'package:vittamovie/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:vittamovie/app/app_widget.dart';
import 'package:vittamovie/app/modules/detail/detail_module.dart';
import 'package:vittamovie/app/modules/detail/detail_page.dart';
import 'package:vittamovie/app/modules/home/home_module.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/detail',  module: DetailModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
