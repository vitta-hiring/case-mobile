import 'package:appfilmes/src/models/movie.dart';
import 'package:appfilmes/src/pages/MoviePage/detalhes.dart';
import 'package:appfilmes/src/pages/MoviePage/poster.dart';
import 'package:appfilmes/src/pages/MoviePage/sinopse.dart';
import 'package:appfilmes/src/services/ApiCalls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MoviePage extends StatefulWidget {

  final Movie movie;

  MoviePage({@required this.movie });

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {

  Movie fullMovie;

  bool loading = false;
  
  bool erroSearch =  false;

  String erroMsg = '';

  void initState() {
    carregarRestanteDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.movie.title} (${widget.movie.year})'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.only(top:10),
        child: 
          (loading ?
            Center(
              child: CircularProgressIndicator(
                value: null,
              )
            ) :
            (erroSearch ?
              Center(
                child: Text(
                  erroMsg,
                  style: TextStyle(color: Colors.redAccent,fontSize: 20),
                  textAlign: TextAlign.center,
                )
              ) :
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Poster(posterUrl:fullMovie.posterUrl),
                      DetalhesFilme( movie: fullMovie ),
                    ],
                  ),
                  Sinopse(plot: fullMovie.plot),
                ],
              )
            )
          )
      )
    );
  }

  carregarRestanteDados() async {
    setState(() {
      loading = true;
    });
    try{
      var response = await ApiCalls.searchById(widget.movie.imdbID);
      setState(() {
        fullMovie = response;
        erroSearch = false;
        loading = false;
      });
    }
    catch(error) {
      errorHandle(error);
    }
  }

  void errorHandle(error) {
    var msgErro = 'Houve algum problema.';
    setState(() {
      loading = false;
      erroSearch = true;
      erroMsg = msgErro;
    });
  }
}