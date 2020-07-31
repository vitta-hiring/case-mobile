import 'package:flutter_test/flutter_test.dart';
import 'package:vitta_test/app/models/movie_details_model.dart';
import 'package:vitta_test/app/models/rating_model.dart';
import 'package:vitta_test/app/modules/movie_list/omdb_service.dart';

void main() {
  final title = 'Rambo';
  final year = 2008;
  final imdbId = 'tt0462499';
  final type = OMDB_MOVIE_SEARCH_TYPE;
  final poster =
      'https://m.media-amazon.com/images/M/MV5BMTI5Mjg1MzM4NF5BMl5BanBnXkFtZTcwNTAyNzUzMw@@._V1_SX300.jpg';
  final rated = 'R';
  final released = '25 Jan 2008';
  final runtime = '92 min';
  final genre = 'Action, Thriller';
  final director = 'Sylvester Stallone';
  final writer =
      'Art Monterastelli, Sylvester Stallone, David Morrell (character)';
  final actors =
      'Sylvester Stallone, Julie Benz, Matthew Marsden, Graham McTavish';
  final plot =
      'In Thailand, John Rambo joins a group of mercenaries to venture into war-torn Burma, and rescue a group of Christian aid workers who were kidnapped by the ruthless local infantry unit.';
  final language = 'English, Burmese, Thai';
  final country = 'Germany, USA, Thailand';
  final awards = '1 win & 1 nomination.';
  final metascore = '46';
  final imdbRating = '7.0';
  final imdbVotes = '214,002';
  final dvd = '27 May 2008';
  final boxOffice = '\$42,724,402';
  final production = 'Lionsgate';
  final website = 'N/A';
  final ratingSource = 'Rotten Tomatoes';
  final ratingValue = '38%';

  group('RatingModel test', () {
    final RatingModel reating =
        RatingModel(source: ratingSource, value: ratingValue);
    final MovieDetailsModel movie = MovieDetailsModel(
        title: title,
        year: year,
        imdbId: imdbId,
        type: type,
        poster: poster,
        rated: rated,
        released: released,
        runtime: runtime,
        genre: genre,
        director: director,
        writer: writer,
        actors: actors,
        plot: plot,
        language: language,
        country: country,
        awards: awards,
        metascore: metascore,
        imdbRating: imdbRating,
        imdbVotes: imdbVotes,
        dvd: dvd,
        boxOffice: boxOffice,
        production: production,
        website: website,
        ratings: [reating]);
    test('Should return a RatingModel', () {
      expect(movie.imdbId, imdbId);
      expect(movie.title, title);
      expect(movie.poster, poster);
      expect(movie.type, type);
    });

    test(
        'Should return a JSON MovieDescriptionModel when object MovieDescriptionModel is informed',
        () {
      Map<String, dynamic> movieMap = movie.toJson();
      expect(movie.imdbId, movieMap['imdbID']);
      expect(movie.title, movieMap['Title']);
      expect(movie.poster, movieMap['Poster']);
      expect(movie.type, movieMap['Type']);
    });

    test('Should return a MovieDescriptionModel when JSON is informed', () {
      Map<String, dynamic> movieMap = {
        'imdbID': imdbId,
        'Title': title,
        'Poster': poster,
        'Type': type,
        'Rated': rated,
        'Released': released,
        'Runtime': runtime,
        'Genre': genre,
        'Director': director,
        'Writer': writer,
        'Actors': actors,
        'Plot': plot,
        'Language': language,
        'Country': country,
        'Awards': awards,
        'Ratings': [reating.toJson()],
        'Metascore': metascore,
        'imdbRating': imdbRating,
        'imdbVotes': imdbVotes,
        'DVD': dvd,
        'BoxOffice': boxOffice,
        'Production': production,
        'Website': website,
      };
      MovieDetailsModel movieDescription = MovieDetailsModel.fromJson(movieMap);
      expect(movieMap['imdbID'], movieDescription.imdbId);
      expect(movieMap['Title'], movieDescription.title);
      expect(movieMap['Poster'], movieDescription.poster);
      expect(movieMap['Type'], movieDescription.type);
      expect(movieMap['Rated'], movieDescription.rated);
      expect(movieMap['Released'], movieDescription.released);
      expect(movieMap['Runtime'], movieDescription.runtime);
      expect(movieMap['Genre'], movieDescription.genre);
      expect(movieMap['Director'], movieDescription.director);
      expect(movieMap['Writer'], movieDescription.writer);
      expect(movieMap['Actors'], movieDescription.actors);
      expect(movieMap['Plot'], movieDescription.plot);
      expect(movieMap['Language'], movieDescription.language);
      expect(movieMap['Country'], movieDescription.country);
      expect(movieMap['Awards'], movieDescription.awards);
      expect(movieMap['Metascore'], movieDescription.metascore);
      expect(movieMap['imdbRating'], movieDescription.imdbRating);
      expect(movieMap['imdbVotes'], movieDescription.imdbVotes);
      expect(movieMap['DVD'], movieDescription.dvd);
      expect(movieMap['BoxOffice'], movieDescription.boxOffice);
      expect(movieMap['Production'], movieDescription.production);
      expect(movieMap['Website'], movieDescription.website);
      expect(
          movieMap['Ratings'],
          (movieDescription.ratings ?? [])
              .map((rating) => rating.toJson())
              .toList());
    });
  });
}
