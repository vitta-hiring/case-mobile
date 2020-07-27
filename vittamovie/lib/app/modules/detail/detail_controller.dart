import 'package:mobx/mobx.dart';
import 'package:vittamovie/app/modules/detail/repository/MovieDetailRepository.dart';
import 'model/MovieDetail.dart';
part 'detail_controller.g.dart';

class DetailController = _DetailControllerBase with _$DetailController;

abstract class _DetailControllerBase with Store {

  final MovieDetailRepository repository;

  @observable
  ObservableFuture<MovieDetail> movieDetail;

  _DetailControllerBase(this.repository){
  }

  @action
  findById(String id){
    movieDetail = this.repository.getMovieById(id).asObservable();
  }
}
