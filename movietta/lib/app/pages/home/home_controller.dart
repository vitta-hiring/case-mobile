import 'package:mobx/mobx.dart';
import 'package:movietta/app/shared/models/movie_model.dart';
import 'package:movietta/app/shared/repositories/movie_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MovieRepository repository;
  String title = 'Star';
  int pageCount = 1;

  @observable
  ObservableFuture<List<MovieModel>> movies;

  _HomeControllerBase(this.repository) {
    fetchMovies();
  }

  @action
  fetchMovies() {
    pageCount = 1;
    movies = repository.searchMoviesByTitle(title).asObservable();
  }

  @action
  fetchMore() {
    pageCount++;
    movies = repository
        .searchMoviesByTitle(title + '&page=$pageCount')
        .asObservable();
  }
}
