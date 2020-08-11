import 'package:mobx/mobx.dart';
import 'package:movietta/app/shared/models/movie_model.dart';
import 'package:movietta/app/shared/repositories/movie_repository.dart';

part 'detail_controller.g.dart';

class DetailController = _DetailControllerBase with _$DetailController;

abstract class _DetailControllerBase with Store {
  final MovieRepository repository;
  String imdbId;

  @observable
  ObservableFuture<MovieModel> movie;

  _DetailControllerBase(this.repository) {
    getFullMovieData();
  }

  @action
  getFullMovieData() {
    movie = repository.getMovieByImdbId(imdbId).asObservable();
  }
}
