import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vitta_test/app/modules/movie_list/full_movie_model.dart';

import 'package:vitta_test/app/modules/movie_list/omdb_service.dart';
import 'package:vitta_test/app/modules/movie_list/movie_model.dart';

class OMDBServiceMock extends Mock implements OMDBService {}

final FullMovieModel ramboFullMovie = FullMovieModel(
  title: 'Rambo',
  year: 2008,
  imdbId: 'tt0462499',
  type: OMDB_MOVIE_SEARCH_TYPE,
  poster:
      'https://m.media-amazon.com/images/M/MV5BMTI5Mjg1MzM4NF5BMl5BanBnXkFtZTcwNTAyNzUzMw@@._V1_SX300.jpg',
  rated: "R",
  released: "25 Jan 2008",
  runtime: "92 min",
  genre: "Action, Thriller",
  director: "Sylvester Stallone",
  writer: "Art Monterastelli, Sylvester Stallone, David Morrell (character)",
  actors: "Sylvester Stallone, Julie Benz, Matthew Marsden, Graham McTavish",
  plot:
      "In Thailand, John Rambo joins a group of mercenaries to venture into war-torn Burma, and rescue a group of Christian aid workers who were kidnapped by the ruthless local infantry unit.",
  language: "English, Burmese, Thai",
  country: "Germany, USA, Thailand",
  awards: "1 win & 1 nomination.",
  metascore: "46",
  imdbRating: "7.0",
  imdbVotes: "214,002",
  dvd: "27 May 2008",
  boxOffice: "\$42,724,402",
  production: "Lionsgate",
  website: "N/A",
);
final MovieModel ramboMovie = MovieModel(
  title: 'Rambo',
  year: 2008,
  imdbID: 'tt0462499',
  type: OMDB_MOVIE_SEARCH_TYPE,
  poster:
      'https://m.media-amazon.com/images/M/MV5BMTI5Mjg1MzM4NF5BMl5BanBnXkFtZTcwNTAyNzUzMw@@._V1_SX300.jpg',
);
final MovieModel ramboFirstBloodPartIIMovie = MovieModel(
  title: 'Rambo: First Blood Part II',
  year: 1985,
  imdbID: 'tt0089880',
  type: OMDB_MOVIE_SEARCH_TYPE,
  poster:
      'https://m.media-amazon.com/images/M/MV5BZWFkY2I1ZDAtNmZhNS00NjVlLWJiMGQtMGQ1ZmM0ZDA5ODg5XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg',
);
final MovieModel ramboIIIMovie = MovieModel(
  title: 'Rambo III',
  year: 1988,
  imdbID: 'tt0095956',
  type: OMDB_MOVIE_SEARCH_TYPE,
  poster:
      'https://m.media-amazon.com/images/M/MV5BZTQ4NjhkZWEtODY1MC00MzllLTkzNDYtZWVkMjNlNWRiOTdjXkEyXkFqcGdeQXVyMTAzMDM4MjM0._V1_SX300.jpg',
);
final MovieModel ramboSerie = MovieModel(
  title: 'Rambo',
  year: 1986,
  imdbID: 'tt0222619',
  type: OMDB_SERIES_SEARCH_TYPE,
  poster:
      'https://m.media-amazon.com/images/M/MV5BZDQ0M2M2MjktMmViYy00MDM5LWE1NWEtZmRhNzZmMGM3MzkxXkEyXkFqcGdeQXVyMjY3MjUzNDk@._V1_SX300.jpg',
);

void main() {
  OMDBServiceMock serviceMock;

  setUp(() {
    serviceMock = OMDBServiceMock();
  });

  group('OMDBServiceMock Test', () {
    test("Returns the Rambo movie", () async {
      final serviceMock = OMDBServiceMock();
      final String search = 'tt0462499';
      when(serviceMock.getMidiaById(search))
          .thenAnswer((_) async => ramboFullMovie);

      FullMovieModel fullMovie = await serviceMock.getMidiaById(search);
      expect(fullMovie, isA<FullMovieModel>());
      expect(fullMovie.imdbId, ramboFullMovie.imdbId);
      expect(fullMovie.title, ramboFullMovie.title);
    });

    test("Returns null for a non-existent movie", () async {
      final serviceMock = OMDBServiceMock();
      final String search = 'aaaaa';
      when(serviceMock.getMidiaById(search)).thenAnswer((_) async => null);

      FullMovieModel fullMovie = await serviceMock.getMidiaById(search);
      expect(fullMovie, null);
    });

    test("Returns the list of movies that contain 'rambo'", () async {
      final String search = 'rambo';
      when(serviceMock.getMoviesByTitle(search)).thenAnswer((_) async => [
            ramboMovie,
            ramboFirstBloodPartIIMovie,
            ramboIIIMovie,
          ]);

      List<MovieModel> movies = await serviceMock.getMoviesByTitle(search);
      expect(movies, isA<List<MovieModel>>());
      expect(movies, [
        ramboMovie,
        ramboFirstBloodPartIIMovie,
        ramboIIIMovie,
      ]);
    });

    test("Returns the list of series containing 'rambo'", () async {
      final String search = 'rambo';
      when(serviceMock.getSeriesByTitle(search)).thenAnswer((_) async => [
            ramboSerie,
          ]);

      List<MovieModel> movies = await serviceMock.getSeriesByTitle(search);
      expect(movies, isA<List<MovieModel>>());
      expect(movies, [
        ramboSerie,
      ]);
    });

    test("Returns an empty list of movies that contains 'rambo'", () async {
      final String search = 'rambo';
      when(serviceMock.getMoviesByTitle(search)).thenAnswer((_) async => []);

      List<MovieModel> movies = await serviceMock.getMoviesByTitle(search);
      expect(movies, []);
    });

    test("Returns an empty series list that contains 'rambo'", () async {
      final String search = 'rambo';
      when(serviceMock.getSeriesByTitle(search)).thenAnswer((_) async => []);

      List<MovieModel> movies = await serviceMock.getSeriesByTitle(search);
      expect(movies, []);
    });

    test("Returns an empty episode list that contains 'rambo'", () async {
      final String search = 'rambo';
      when(serviceMock.getEpisodesByTitle(search)).thenAnswer((_) async => []);

      List<MovieModel> movies = await serviceMock.getEpisodesByTitle(search);
      expect(movies, []);
    });
  });
}
