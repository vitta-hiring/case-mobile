import 'package:flutter/cupertino.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/models/movie_summary.dart';
import 'package:movies/models/search_params.dart';
import 'package:movies/repositories/movies_repository.dart';

class MoviesProvider with ChangeNotifier {
  MoviesRepository _repository = MoviesRepository();

  HomePageState _homePageState = HomePageState.Initial;
  HomePageState get homePageState => this._homePageState;
  set homePageState(HomePageState value) {
    this._homePageState = value;
    notifyListeners();
  }

  MovieDetailsPageState _movieDetailsPageState = MovieDetailsPageState.Loading;
  MovieDetailsPageState get movieDetailsPageState =>
      this._movieDetailsPageState;
  set movieDetailsPageState(MovieDetailsPageState value) {
    this._movieDetailsPageState = value;
    notifyListeners();
  }

  List<MovieSummary> _foundMovies = List<MovieSummary>();
  List<MovieSummary> get foundMovies => this._foundMovies;
  set foundMovies(List<MovieSummary> value) {
    this._foundMovies = value;
  }

  Movie _selectedMovie = Movie();
  Movie get selectedMovie => this._selectedMovie;
  set selectedMovie(Movie value) {
    this._selectedMovie = value;
  }

  SearchParams _searchParams = SearchParams();

  updateTitle(String value) {
    _searchParams.title = value;
  }

  searchMovies() {
    homePageState = HomePageState.Loading;
    _repository.getMovies(query: _searchParams.toQuery).then((value) {
      foundMovies = value.result;
      if (value.success) {
        homePageState = HomePageState.Result;
      } else {
        homePageState = HomePageState.Error;
      }
    }).catchError((error) {
      homePageState = HomePageState.Error;
    });
  }

  Future<bool> findMovieById(String id) async {
    movieDetailsPageState = MovieDetailsPageState.Loading;
    try {
      selectedMovie = await _repository.getMovieById(id);
      if (selectedMovie.success) {
        movieDetailsPageState = MovieDetailsPageState.Result;
      } else {
        movieDetailsPageState = MovieDetailsPageState.Error;
      }
      return selectedMovie.success;
    } catch (e) {
      movieDetailsPageState = MovieDetailsPageState.Error;
      return false;
    }
  }
}

enum HomePageState {
  Error,
  Empty,
  Initial,
  Loading,
  Result,
}

enum MovieDetailsPageState {
  Error,
  Loading,
  Result,
}
