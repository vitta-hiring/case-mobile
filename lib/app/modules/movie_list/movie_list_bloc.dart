import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:vitta_test/app/models/movie_details_model.dart';
import 'package:vitta_test/app/modules/movie_list/movie_list_module.dart';
import 'package:vitta_test/app/models/movie_model.dart';
import 'package:vitta_test/app/modules/movie_list/omdb_service.dart';

class MovieListBloc extends BlocBase {
  final String type;
  final OMDBService _omdbService =
      MovieListModule.to.getDependency<OMDBService>();

  MovieListBloc({this.type});

  Future<List<MovieModel>> getMovies(String title) {
    return this._omdbService.getMidiaByTitleAndType(title, type);
  }

  Future<MovieDetailsModel> getMoviesByImdbID(String imdbID) {
    return this._omdbService.getMidiaById(imdbID);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
