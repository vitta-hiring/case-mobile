import 'package:mobx/mobx.dart';

import '../../shared/models/movie_model.dart';
import 'home_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeStore store;
  _HomeControllerBase(this.store);

  @observable
  ObservableFuture<List<MovieModel>> moviesListResponse = ObservableFuture.value(null);
}
