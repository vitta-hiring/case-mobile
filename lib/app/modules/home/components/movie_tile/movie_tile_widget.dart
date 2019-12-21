import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:movie_app/app/models/movie_model.dart';
import 'package:movie_app/app/modules/favorite/favorite_controller.dart';
import 'package:movie_app/app/modules/favorite/favorite_module.dart';
import 'package:movie_app/app/services/api/helper/screen_sizes.dart';

import '../../home_controller.dart';
import '../../home_module.dart';

class MovieTileWidget extends StatelessWidget {
  final MovieModel model;
  final Function onPressed;
  final controller = HomeModule.to.bloc<HomeController>();

  var image_url = 'https://image.tmdb.org/t/p/w200/';

  MovieTileWidget({Key key, this.model, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var formatter = new DateFormat('dd/MM/yyyy');
    ScreenSizes.initContext(context);
    final bloc = FavoriteController();
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/noposter.jpg', 
                width: 150.0,
                height: 180.0,
                image:model.poster_path != null ? image_url + model.poster_path : ""
              ),            
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: ScreenSizes.px(300),
                    child: Text(
                      model.title != null ? model.title : "",
                      style: TextStyle(
                          fontSize: ScreenSizes.px(20),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    model.release_date != "" ? "Lançamento: "+ formatter.format(DateTime.parse(model.release_date)): "Lançamento: Indisponível",
                    style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: ScreenSizes.px(24))),
                  SizedBox(
                    height: ScreenSizes.px(8),
                  ),
                  Container(
                    width: ScreenSizes.px(300),
                    child: Text(
                      model.overview != null ? model.overview : "",
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              StreamBuilder<Map<String, MovieModel>>(
                stream: bloc.outFav,
                initialData: {},
                builder: (context, snapshot) {
                  if (snapshot.hasData){
                    return IconButton(
                      icon: Icon(snapshot.data.containsKey(model.id.toString())
                          ? Icons.star
                          : Icons.star_border),
                      color: Colors.black,
                      iconSize: 30,
                      onPressed: () {
                        bloc.toggleFavorite(model);
                      },
                    );
                  }else{
                    return Container();
                  }
                    
                },
              ),
            ],
          )),
    );
  }
}
