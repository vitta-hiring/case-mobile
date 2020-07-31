import 'package:VittaChallenge/models/film.dart';
import 'package:VittaChallenge/share_components/load/load_controller.dart';
import 'package:VittaChallenge/widgets/home/home_repository.dart';
import 'package:VittaChallenge/widgets/home/home_state.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final IHomeRepository repo;
  final LoadController load;
  final _state = HomeState().obs;

  HomeController(this.repo, this.load);

  searchFilm(String film) {
    load.status(true);
    _state.update((_) => _.inputFilm = film);
    _state.update((_) => _.films = []);

    EasyDebounce.debounce(
      'debouncer',
      Duration(milliseconds: 700),
      () async {
        List<Film> listFilms = await repo.getFilms(film);
        _state.update((_) => _.films = listFilms);
        _state.update((_) => _.showInput = false);
        load.status(false);
      },
    );
  }

  List<Film> get getFilms => _state.value.films;

  String get getInputValue => _state.value.inputFilm;

  showInput() => _state.value.showInput
      ? _state.update((_) => _.showInput = false)
      : _state.update((_) => _.showInput = true);

  bool statusInput() => _state.value.showInput;

  bool existFilms() =>
      _state.value.films == null || _state.value.films.length == 0
          ? false
          : true;
}
