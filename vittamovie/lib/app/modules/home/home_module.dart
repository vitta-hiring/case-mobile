import 'package:dio/dio.dart';
import 'package:vittamovie/app/modules/detail/detail_page.dart';
import 'package:vittamovie/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vittamovie/app/modules/home/home_page.dart';
import 'package:vittamovie/app/modules/home/repository/MovieRepository.dart';
import 'package:vittamovie/app/shared/utils/Constants.dart';

class HomeModule extends ChildModule {

  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get<MovieRepository>())),
    Bind((i) => MovieRepository(i.get<Dio>())),
    Bind((i) => Dio(BaseOptions(baseUrl: Constants.urlBase))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
