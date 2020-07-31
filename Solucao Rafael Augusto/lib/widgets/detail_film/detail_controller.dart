import 'package:VittaChallenge/models/detailFilm.dart';
import 'package:VittaChallenge/share_components/load/load_controller.dart';
import 'package:VittaChallenge/widgets/detail_film/detail_repository.dart';
import 'package:VittaChallenge/widgets/detail_film/detail_state.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final IDetailRepository repository;
  final LoadController load;

  final _state = DetailState().obs;

  DetailController(this.repository, this.load);

  setDetailFilm(String id) async {
    load.status(true);
    Detail detail = await repository.getDetailFilms(id);
    _state.update((_) => _.detailFilms = detail);
    load.status(false);
  }

  Detail get getDetailFilm => _state.value.detailFilms;
}
