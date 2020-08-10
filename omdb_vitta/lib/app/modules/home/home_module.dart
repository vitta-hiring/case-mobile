import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/services/custom_dio.dart';
import '../../shared/stores/search_store.dart';
import '../movie_search/movie_search_module.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<HomeStore>())),
        Bind((i) => HomeStore(i.get<SearchStore>())),
        Bind((i) => SearchStore()),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router("/detail", module: MovieSearchModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
