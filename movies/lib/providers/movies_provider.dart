import 'package:flutter/cupertino.dart';
import 'package:movies/repositories/movies_repository.dart';

class MoviesProvider with ChangeNotifier {
  MoviesRepository _repository = MoviesRepository();

  HomePageState _homePageState = HomePageState.Initial;
  HomePageState get homePageState => this._homePageState;
  set homePageState(HomePageState value) {
    this._homePageState = value;
    notifyListeners();
  }
}

enum HomePageState {
  Error,
  Empty,
  Initial,
  Loading,
  Result,
}
