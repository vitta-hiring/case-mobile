import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movietta/app/pages/detail/detail_controller.dart';
import 'package:movietta/app/shared/models/movie_model.dart';
import 'package:movietta/app/shared/models/rating_domain_enum.dart';
import 'package:movietta/app/utils/image_loader.dart';
import 'package:movietta/app/widgets/white_text_widget.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final detailController = Modular.get<DetailController>();

  @override
  void initState() {
    super.initState();
    detailController.getFullMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (detailController.movie.value == null) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SpinKitWanderingCubes(
                color: Colors.deepPurple,
              ),
            ),
          );
        }
        if (detailController.movie.value != null) {
          MovieModel movieModel = detailController.movie.value;
          return Scaffold(
            backgroundColor: Colors.black,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black,
                  floating: false,
                  flexibleSpace: Image(
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                    colorBlendMode: BlendMode.dstATop,
                    image: NetworkImage(movieModel.poster),
                    fit: BoxFit.cover,
                  ),
                  expandedHeight: 300,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: SizedBox(
                              height: 250,
                              width: 200,
                              child: Image.network(movieModel.poster),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: SizedBox(
                              height: 250,
                              width: 160,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: WhiteText(
                                      text: movieModel.title,
                                      fontSize: 23,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 1),
                                    child: WhiteText(
                                      text: movieModel.director,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: WhiteText(
                                      text: movieModel.released,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: ImageLoader.fromAsset(
                                              'imdb-star'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: WhiteText(
                                            text: movieModel.imdbRating,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: WhiteText(
                                      text: movieModel.runtime,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: WhiteText(
                                      text: movieModel.genre,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        child: WhiteText(
                          text: movieModel.actors,
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(15.0),
                          child: WhiteText(
                            text: movieModel.plot,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) {
                      return Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 150,
                                  width: 100,
                                  child: (movieModel.ratings[index].logo),
                                ),
                                Spacer(),
                                Container(
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Stack(
                                      children: <Widget>[
                                        (movieModel
                                            .ratings[index].valueBackground),
                                        if (movieModel
                                                .ratings[index].raterDomain !=
                                            RaterDomain.ROTTEN)
                                          Center(
                                            child: Text(
                                              movieModel.ratings[index].value,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        if (movieModel
                                                .ratings[index].raterDomain ==
                                            RaterDomain.ROTTEN)
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child: Text(
                                                movieModel.ratings[index].value,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                    childCount: movieModel.ratings.length,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
