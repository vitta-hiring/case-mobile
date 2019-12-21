import 'package:mobx/mobx.dart';
import 'package:movie_app/app/models/movie_detail_model.dart';

import 'package:movie_app/app/services/api/omdb_api_service.dart';

part 'detail_controller.g.dart';

class DetailController = _DetailBase with _$DetailController;

abstract class _DetailBase with Store {
  String vasco = "";
  final OmdbApiService service;
  MovieDetailModel movie;

  _DetailBase(this.service) {
    _init();
  }

  _init() async {
    final topPopularityResponse = await service.topPopularity();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
