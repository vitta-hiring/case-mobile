import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vitta_test/app/helpers/url_launch_helper.dart';
import 'package:vitta_test/app/models/movie_details_model.dart';
import 'package:vitta_test/app/models/movie_model.dart';
import 'package:vitta_test/app/models/rating_model.dart';

const title = 'Detalhes';

class MovieDetailsPage extends StatefulWidget {
  final MovieModel _movieModel;
  final Future<MovieDetailsModel> _futureMovieDescriptionModel;

  const MovieDetailsPage(this._movieModel, this._futureMovieDescriptionModel);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final padding = const EdgeInsets.only(bottom: 8);

  _launchYoutube(final String movieTitle) async {
    final url =
        'https://www.youtube.com/results?search_query=$movieTitle TRAILER';
    if (!await LaunchHelper.launchUrl(url)) {
      Fluttertoast.showToast(
        msg: "Não é possível abrir a URL",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    }
  }

  _launchWebsite(String website) async {
    if (!await LaunchHelper.launchUrl(website)) {
      Fluttertoast.showToast(
        msg: "Não é possível abrir a URL",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    }
  }

  _buildSliverApp(final height) => SliverAppBar(
        title: Text(this.widget._movieModel.title),
        expandedHeight: height,
        centerTitle: true,
        flexibleSpace: Hero(
          tag: this.widget._movieModel.imdbID,
          child: Image.network(
            this.widget._movieModel.poster,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sliverAppBar = this._buildSliverApp(size.height * 0.7);
    return SafeArea(
      child: Material(
        child: FutureBuilder<MovieDetailsModel>(
          future: this.widget._futureMovieDescriptionModel,
          builder: (_, AsyncSnapshot<MovieDetailsModel> snap) {
            if (!snap.hasData)
              return CustomScrollView(
                slivers: <Widget>[sliverAppBar],
              );
            final movie = snap.data;
            return CustomScrollView(
              slivers: [
                sliverAppBar,
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
                  sliver: SliverVisibility(
                    visible: snap.hasData,
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: padding,
                          child: ListTile(
                            title: Text('${movie.title}'),
                            subtitle: Text('${movie.year}'),
                            contentPadding: EdgeInsets.zero,
                            trailing: RaisedButton(
                                color: Colors.red[400],
                                child: Text(
                                  'TRAILER',
                                ),
                                onPressed: () =>
                                    this._launchYoutube(movie.title)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              movie.genre.toString().replaceAll(', ', ' | '),
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              movie.runtime,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Padding(
                          padding: padding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                movie.language,
                                style: TextStyle(fontSize: 10),
                              ),
                              Text(
                                movie.country,
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: padding,
                          child: Text(
                            '${movie.plot}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        this._buildInfo('Actors', movie.actors),
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: <Widget>[
                            this._buildInfo('Production', movie.production),
                            this._buildInfo('Director', movie.director),
                            this._buildInfo('Released', movie.released),
                          ],
                        ),
                        this._buildInfo('Writers', movie.writer),
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: (movie.ratings ?? [])
                              .map(
                                  (rating) => this._buildRatingWithIcon(rating))
                              .toList(),
                        ),
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          children: <Widget>[
                            this._buildInfo('Awards', movie.awards),
                            this._buildInfo('BoxOffice', movie.boxOffice),
                          ],
                        ),
                        Visibility(
                          visible: movie.website != 'N/A',
                          child: InkWell(
                            onTap: () => _launchWebsite(movie.website),
                            child: Center(
                                child: this._buildInfo(
                                    'Visit website', movie.website)),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Row _buildRatingWithIcon(RatingModel rating) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset(
              RatingModel.getPathIcon(rating.source),
              height: 75,
            ),
          ),
          Expanded(
            flex: 2,
            child: _buildInfo('${rating.source}', '${rating.value}'),
          ),
        ],
      );

  Padding _buildInfo(String title, String content, {Axis direction}) => Padding(
        padding: this.padding,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          direction: direction ?? Axis.vertical,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 16)),
            Text(
              content != 'N/A' ? content : 'Uninformed',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      );
}
