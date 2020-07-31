import 'package:flutter/material.dart';
import 'package:vitta_test/app/models/movie_model.dart';
import 'package:vitta_test/app/modules/movie_details/movie_details_page.dart';
import 'package:vitta_test/app/modules/movie_list/movie_list_bloc.dart';
import 'package:vitta_test/app/modules/movie_list/movie_list_module.dart';

class MovieListPage extends StatefulWidget {
  final String type;

  const MovieListPage({this.type});

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final MovieListBloc _movieListBloc =
      MovieListModule.to.getBloc<MovieListBloc>();
  Future<List<MovieModel>> _movies;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    this._movies = this._movieListBloc.getMovies(this.widget.type);
    super.initState();
  }

  Widget _buildListOfMovies(List<MovieModel> movies) {
    if (movies.isEmpty)
      return Center(
        child: Text('Não encontramos nada, tente outra pesquisa'),
      );
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) =>
          this._buildMovieGridTile(movies[index]),
    );
  }

  Widget _getErrorIcon(String movieTitle) => Container(
        color: Colors.black26,
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          movieTitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      );

  Widget _buildMovieGridTile(MovieModel movie) => GridTile(
        child: InkWell(
          enableFeedback: true,
          child: Hero(
            tag: movie.imdbID,
            child: Image.network(
              movie.poster,
              fit: BoxFit.cover,
              errorBuilder: (_, obj, stack) => this._getErrorIcon(movie.title),
            ),
          ),
          onTap: () => this._goToMovieDetails(movie),
        ),
      );

  _searchMovie() {
    if (this._searchController.text.isNotEmpty)
      setState(() {
        this._movies =
            this._movieListBloc.getMovies(this._searchController.text);
      });
  }

  Widget _getSearchTextInput() => Container(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: this._searchController,
          focusNode: this._searchFocus,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.center,
          onEditingComplete: this._searchMovie,
          cursorColor: Colors.white,
          decoration: InputDecoration.collapsed(
            hintText: 'Pesquisar...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusColor: Colors.white,
            fillColor: Colors.white,
            hoverColor: Colors.white,
          ),
        ),
      );

  _goToMovieDetails(MovieModel movie) async {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetailsPage(
              movie, this._movieListBloc.getMoviesByImdbID(movie.imdbID)),
          fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.type.toUpperCase()),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          this._getSearchTextInput(),
          Expanded(
            child: FutureBuilder<List<MovieModel>>(
                initialData: [],
                future: this._movies,
                builder: (_, AsyncSnapshot<List<MovieModel>> snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snap.hasData) {
                    return this._buildListOfMovies(snap.data);
                  }
                  return Container();
                }),
          )
        ],
      ),
    );
  }
}
