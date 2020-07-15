import 'package:dio/dio.dart';
import 'package:filme/app/shared/models/details_model.dart';
import 'package:filme/app/shared/models/film_model.dart';

// Repositório de buscas

class FilmRepository {
  final Dio dio;

  FilmRepository(this.dio);

  // Função do tipo FilmModel para retorno das buscas resumidas
  Future<List<FilmModel>> getFilms(String nome, String ano) async {
    // Variável de resposta de busca, com ano e nome
    var response =
        await dio.get('/?s=$nome&y=$ano&type=movie&plot=full&apikey=f9b7326a&');

    // Lista de filmes que são retornados e guardados em list
    List<FilmModel> list = [];
    if (response.data['Response'] == "True") {
      for (var json in (response.data['Search'] as List)) {
        FilmModel model = FilmModel(
            title: json['Title'],
            year: json['Year'],
            poster: json['Poster'],
            imdbID: json['imdbID']);
        list.add(model);
      }
      // Caso a busca dê errado, o erro é guardado e retornado
    } else if (response.data['Response'] == "False") {
      FilmModel model = FilmModel(error: response.data['Error']);
      list.add(model);
    }
    return list;
  }

  // Função do tipo DetailsModel para retorno das buscas completas
  Future<DetailsModel> getDetails(String imdbID) async {
    // Variável de resposta de busca, com ID do filme
    var response = await dio.get('/?i=$imdbID&plot=full&apikey=f9b7326a&');

    // Os detalhes do filme buscado são guardados na variável details e retornados
    DetailsModel details = DetailsModel();
    if (response.data['Response'] == "True") {
      details.director = response.data['Director'];
      details.genre = response.data['Genre'];
      details.imdbRating = response.data['imdbRating'];
      details.plot = response.data['Plot'];
    }
    return details;
  }
}
