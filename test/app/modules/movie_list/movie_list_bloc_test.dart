import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vitta_test/app/models/movie_details_model.dart';
import 'package:vitta_test/app/models/movie_model.dart';

import 'package:vitta_test/app/modules/movie_list/movie_list_bloc.dart';
import 'package:vitta_test/app/modules/movie_list/movie_list_module.dart';
import 'package:vitta_test/app/modules/movie_list/omdb_service.dart';

class MovieListBlocMock extends Mock implements MovieListBloc {}

void main() {
  initModule(MovieListModule());
  MovieListBlocMock movieListBlocMock;

  final MovieModel ramboMovie = MovieModel(
    title: 'Rambo',
    year: '2008',
    imdbID: 'tt0462499',
    type: OMDB_MOVIE_SEARCH_TYPE,
    poster:
        'https://m.media-amazon.com/images/M/MV5BMTI5Mjg1MzM4NF5BMl5BanBnXkFtZTcwNTAyNzUzMw@@._V1_SX300.jpg',
  );
  final MovieDetailsModel ramboMovieDetails = MovieDetailsModel(
    title: 'Rambo',
    year: '2008',
    imdbId: 'tt0462499',
    type: OMDB_MOVIE_SEARCH_TYPE,
    poster:
        'https://m.media-amazon.com/images/M/MV5BMTI5Mjg1MzM4NF5BMl5BanBnXkFtZTcwNTAyNzUzMw@@._V1_SX300.jpg',
    rated: 'R',
    released: '25 Jan 2008',
    runtime: '92 min',
    genre: 'Action, Thriller',
    director: 'Sylvester Stallone',
    writer: 'Art Monterastelli, Sylvester Stallone, David Morrell (character)',
    actors: 'Sylvester Stallone, Julie Benz, Matthew Marsden, Graham McTavish',
    plot:
        'In Thailand, John Rambo joins a group of mercenaries to venture into war-torn Burma, and rescue a group of Christian aid workers who were kidnapped by the ruthless local infantry unit.',
    language: 'English, Burmese, Thai',
    country: 'Germany, USA, Thailand',
    awards: '1 win & 1 nomination.',
    metascore: '46',
    imdbRating: '7.0',
    imdbVotes: '214,002',
    dvd: '27 May 2008',
    boxOffice: '\$42,724,402',
    production: 'Lionsgate',
    website: 'N/A',
  );

  setUp(() {
    movieListBlocMock = MovieListBlocMock();
  });

  group('MovieListBloc Test', () {
    test("First Test", () {
      expect(movieListBlocMock, isInstanceOf<MovieListBloc>());
    });

    test('Must returns the list of movies when informed \'rambo\'', () async {
      final search = 'rambo';
      when(movieListBlocMock.getMovies(search))
          .thenAnswer((realInvocation) async => [ramboMovie]);
      final movies = await movieListBlocMock.getMovies(search);
      expect(1, movies.length);
      expect(movies.first.imdbID, ramboMovie.imdbID);
      expect(movies.first.title, ramboMovie.title);
    });

    test('Must returns an empty list when informed a non-existent movie',
        () async {
      final String search = 'tttt';
      when(movieListBlocMock.getMovies(search))
          .thenAnswer((realInvocation) async => []);

      final movies = await movieListBlocMock.getMovies(search);
      expect(0, movies.length);
    });

    test('Must returns the Rambo movie', () async {
      final search = 'tt0095956';
      when(movieListBlocMock.getMoviesByImdbID(search))
          .thenAnswer((realInvocation) async => ramboMovieDetails);
      final movieDetails = await movieListBlocMock.getMoviesByImdbID(search);
      expect(ramboMovieDetails, movieDetails);
    });
    test('Must returns null when a non-existent movie', () async {
      final search = 'kkkkkk';
      when(movieListBlocMock.getMoviesByImdbID(search))
          .thenAnswer((realInvocation) async => null);
      final movieDetails = await movieListBlocMock.getMoviesByImdbID(search);
      expect(null, movieDetails);
    });
  });
}
