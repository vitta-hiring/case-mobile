import 'package:VittaChallenge/models/film.dart';

class HomeState {
  String inputFilm;
  List<Film> films;
  bool showInput;
  HomeState({this.inputFilm = "", this.films, this.showInput = false});
}
