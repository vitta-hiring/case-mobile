import 'package:VittaChallenge/models/film.dart';
import 'package:VittaChallenge/services/http/http_adapter.dart';
import 'package:VittaChallenge/widgets/home/home_repository.dart';

class MockHomeRepository implements IHomeRepository {
  final HttpAdapter http;

  MockHomeRepository(this.http);

  @override
  Future<List<Film>> getFilms(String name) async {
    List<Film> films = List<Film>();

    if (name == 'rambo') {
      print(name);
      films.add(Film.fromJson({
        "Title": "rambo",
        "Year": "2008",
        "imdbID": "tt0462499",
        "Type": "movie",
        "Poster":
            "https://m.media-amazon.com/images/M/MV5BMTI5Mjg1MzM4NF5BMl5BanBnXkFtZTcwNTAyNzUzMw@@._V1_SX300.jpg"
      }));
    }

    return films;
  }
}
