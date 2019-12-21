import 'package:mobx/mobx.dart';
import 'package:movie_app/app/models/movie_detail_model.dart';
import 'package:movie_app/app/models/movie_model.dart';
import 'package:movie_app/app/services/api/omdb_api_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  String vasco = "";
  final OmdbApiService service;
  List<MovieModel> movies;
  MovieDetailModel movie;
  _HomeBase(this.service) {
    _init();
  }

  _init() async {
    final topPopularityResponse = await service.topPopularity();
    list.addAll(topPopularityResponse);
  }

  @action
  searchVideos(String search) async {
    if (search != null) {
      movies = await service.searchVideos(search);
      txtTab01 = "resultados...";
    } else {
      movies = list + await service.nextPageVideos();
    }
      list.clear();
      list.addAll(movies);
  }

  listMovie(int id) async {
    movie = await service.getDetailMovie(id);
    return movie;
  }

  @observable
  ObservableList<MovieModel> list = ObservableList<MovieModel>();

  @observable
  String txtTab01;

  @observable
  String txtTab02;
}
