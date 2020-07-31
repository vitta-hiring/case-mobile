import 'package:VittaChallenge/models/detailFilm.dart';
import 'package:VittaChallenge/models/film.dart';
import 'package:VittaChallenge/services/http/http_adapter.dart';

class IDetailRepository {
  Future<Detail> getDetailFilms(String id) async {}
}

class DetailRepository implements IDetailRepository {
  final HttpAdapter http;

  DetailRepository(this.http);

  @override
  Future<Detail> getDetailFilms(String id) async {
    final response = await http.getApi("&i=$id");
    Detail detail = Detail.fromJson(response);
    return detail;
  }
}
