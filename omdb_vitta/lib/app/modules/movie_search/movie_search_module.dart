import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/services/custom_dio.dart';
import '../../shared/stores/search_store.dart';
import 'movie_search_controller.dart';
import 'movie_search_page.dart';
import 'movie_search_repository.dart';
import 'movie_search_store.dart';

class MovieSearchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MovieSearchController(
              i.get<MovieSearchRepository>(),
              i.get<MovieSearchStore>(),
            )),
        Bind((i) => MovieSearchRepository(Modular.get<CustomDio>())),
        Bind((i) => MovieSearchStore(Modular.get<SearchStore>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MovieSearchPage()),
      ];

  static Inject get to => Inject<MovieSearchModule>.of();
}
