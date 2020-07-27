import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';
import 'package:vittamovie/app/modules/home/model/Movie.dart';
import 'package:vittamovie/app/modules/home/widgets/movie_item_view.dart';
import 'package:vittamovie/app/shared/utils/SizeContants.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movies;

  const MovieListView({@required Key key, @required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(this.movies != null){
      return Expanded(child: Container(
          margin: EdgeInsets.fromLTRB(SizeContants.normal, 0, SizeContants.normal, 0),
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio:  MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 2),
            crossAxisSpacing: 10,
            children: List.generate( movies.length, (index) {
              var movie = movies[index];
              return Container(
                child:
                  GestureDetector(
                  child: MovieItemView(movie: movie),
                  onTap: () {
                    Modular.to.pushNamed('detail/'+movie.imdbID);
                  }),
              );
            }),
          )));
    }else{
      return CircularProgressIndicator();
    }
  }
}

