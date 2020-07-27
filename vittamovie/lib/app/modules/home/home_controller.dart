import 'package:mobx/mobx.dart';
import 'package:vittamovie/app/modules/home/repository/MovieRepository.dart';
import 'model/Movie.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final MovieRepository repository;

  @observable
  ObservableFuture<List<Movie>> movies;

  _HomeControllerBase(this.repository){
  }

  @action
  findByTerm(String term){
    movies = this.repository.getMoviesByTerm(term).asObservable();
  }
}
