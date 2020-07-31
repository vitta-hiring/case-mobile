import 'package:flutter_test/flutter_test.dart';
import 'package:vitta_test/app/models/movie_model.dart';
import 'package:vitta_test/app/modules/movie_list/omdb_service.dart';

void main() {
  final title = 'Rambo';
  final year = '2008';
  final imdbID = 'tt0462499';
  final type = OMDB_MOVIE_SEARCH_TYPE;
  final poster =
      'https://m.media-amazon.com/images/M/MV5BMTI5Mjg1MzM4NF5BMl5BanBnXkFtZTcwNTAyNzUzMw@@._V1_SX300.jpg';

  group('MovieModel test', () {
    test('Should return a MovieModel', () {
      final MovieModel movie = MovieModel(
          title: title, year: year, imdbID: imdbID, type: type, poster: poster);

      expect(title, movie.title);
      expect(year, movie.year);
      expect(imdbID, movie.imdbID);
      expect(type, movie.type);
      expect(poster, movie.poster);
    });

    test('Should return a JSON MovieModel when object MovieModel is informed',
        () {
      final MovieModel movie = MovieModel(
          title: title, year: year, imdbID: imdbID, type: type, poster: poster);
      Map movieMap = movie.toJson();
      expect(movie.title, movieMap['Title']);
      expect(movie.year, movieMap['Year']);
      expect(movie.imdbID, movieMap['imdbID']);
      expect(movie.type, movieMap['Type']);
      expect(movie.poster, movieMap['Poster']);
    });

    test('Should return a MovieModel when JSON is informed', () {
      Map<String, dynamic> movieMap = {
        'Title': title,
        'Year': year,
        'imdbID': imdbID,
        'Type': type,
        'Poster': poster,
      };
      MovieModel movie = MovieModel.fromJson(movieMap);
      expect(movieMap['Title'], movie.title);
      expect(movieMap['Year'], movie.year);
      expect(movieMap['imdbID'], movie.imdbID);
      expect(movieMap['Type'], movie.type);
      expect(movieMap['Poster'], movie.poster);
    });

    test('Should return a MovieModel serialized and deserialized', () {
      final MovieModel movie = MovieModel(
          title: title, year: year, imdbID: imdbID, type: type, poster: poster);

      final movieJson = movie.toJson();
      final anotherMovie = MovieModel.fromJson(movieJson);

      expect(movie, anotherMovie);
    });
  });
}
