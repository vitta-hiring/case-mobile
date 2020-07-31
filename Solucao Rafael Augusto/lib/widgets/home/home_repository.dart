import 'package:VittaChallenge/models/film.dart';
import 'package:VittaChallenge/services/http/http_adapter.dart';

class IHomeRepository {
  Future<List<Film>> getFilms(String name) async {}
}

class HomeRepository implements IHomeRepository {
  final HttpAdapter http;

  HomeRepository(this.http);

  @override
  Future<List<Film>> getFilms(String name) async {
    List<Film> films = List<Film>();

    final response = await http.getApi("&s=$name&type=movie");

    if (response['Search'].runtimeType != Null) {
      List<dynamic> listFilms = response['Search'];
      listFilms.map((f) => films.add(Film.fromJson(f))).toList();
    }

    return films;
  }
}
