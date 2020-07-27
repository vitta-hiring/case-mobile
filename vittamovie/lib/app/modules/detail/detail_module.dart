import 'package:dio/dio.dart';
import 'package:vittamovie/app/modules/detail/detail_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vittamovie/app/modules/detail/detail_page.dart';
import 'package:vittamovie/app/modules/detail/repository/MovieDetailRepository.dart';
import 'package:vittamovie/app/shared/utils/Constants.dart';

class DetailModule extends ChildModule {

  @override
  List<Bind> get binds => [
    Bind((i) => DetailController(i.get<MovieDetailRepository>())),
    Bind((i) => MovieDetailRepository(i.get<Dio>())),
    Bind((i) => Dio(BaseOptions(baseUrl: Constants.urlBase))),
      ];

  @override
  List<Router> get routers => [
        Router("/:id", child: (_, args) => DetailPage(id : args.params["id"])),
      ];

  static Inject get to => Inject<DetailModule>.of();
}
