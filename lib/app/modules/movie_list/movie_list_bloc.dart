import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:vitta_test/app/models/movie_description_model.dart';
import 'package:vitta_test/app/modules/movie_list/movie_list_module.dart';
import 'package:vitta_test/app/models/movie_model.dart';
import 'package:vitta_test/app/modules/movie_list/omdb_service.dart';

class MovieListBloc extends BlocBase {
  final OMDBService _omdbService =
      MovieListModule.to.getDependency<OMDBService>();
  //dispose will be called automatically by closing its streams

  Future<List<MovieModel>> getMovies(String title) {
    return this._omdbService.getMoviesByTitle(title);
  }

  Future<MovieDetailsModel> getMoviesByImdbID(String imdbID) {
    return this._omdbService.getMidiaById(imdbID);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
