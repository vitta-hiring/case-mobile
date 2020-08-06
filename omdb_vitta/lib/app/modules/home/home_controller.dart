import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/movie_model.dart';
import 'home_repository.dart';
import 'home_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends Disposable with Store {
  final HomeRepository repository;
  final HomeStore store;
  ReactionDisposer _disposer;

  _HomeControllerBase(this.repository, this.store) {
    _disposer = reaction((_) => store.searchStore.searchData, (data) {
      if (data.length >= 3) {
        // Modular.link.pushNamed("/detail");
        print(data);
      }
    });
  }

  @observable
  ObservableFuture<List<MovieModel>> moviesListResponse = ObservableFuture.value(null);

  @action
  doSearchMovie(String movieName) async {
    try {
      moviesListResponse = repository.searchMovie(movieName).asObservable();
      await moviesListResponse;
      print(moviesListResponse.value);
      print(moviesListResponse.value.length);
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _disposer();
  }
}
