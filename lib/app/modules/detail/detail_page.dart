import 'package:flutter/material.dart';
import 'package:movie_app/app/models/genres_model.dart';
import 'package:movie_app/app/models/movie_detail_model.dart';

import 'package:movie_app/app/modules/detail/components/rate_widget.dart';
import 'package:movie_app/app/modules/detail/components/sinopse_widget.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final MovieDetailModel model;

  const DetailPage({Key key, this.title, this.model}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    var image_url = 'https://image.tmdb.org/t/p/w500';
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe do filme"),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 140.0),
                child: Image.network(
                  model.backdrop_path != null ? image_url + model.backdrop_path : "",
                  width: screenWidth,
                  height: 230.0,
                  fit: BoxFit.cover,
              )),               
              Positioned(
                bottom: 0.0,
                left: 16.0,
                right: 16.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(6.0),
                      elevation: 2.0,
                      child: Image.network(
                        model.poster_path != null
                          ? image_url + model.poster_path
                          : "",
                        fit: BoxFit.cover,
                        width: 130,
                        height: 170
                         ),
    ),                  
                    SizedBox(width: 16.0),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            model.title,
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          RateWidget(model)
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SinopseWidget(model.overview),
          ),
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: _createGenres())
        ],
      ),
    );
  }
  List<Widget> _createGenres() {
    return model.genres.map((genero) {
      return Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Chip(
          label: Text(genero.name),         
          backgroundColor: Colors.amber,
        ),);
    }).toList();
  }
}
