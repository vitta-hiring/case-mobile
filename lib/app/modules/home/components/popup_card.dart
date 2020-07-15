import 'package:filme/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PopUpCard extends StatefulWidget {
  final String titleCard;
  final String yearCard;
  final String imdbIDCard;
  final String directorCard;
  final String genreCard;
  final String imdbRatingCard;
  final String plotCard;
  final String typeCard;

  // Construtor do Modal Bottom Sheet
  const PopUpCard(
      [this.titleCard,
      this.yearCard,
      this.imdbIDCard,
      this.directorCard,
      this.genreCard,
      this.imdbRatingCard,
      this.plotCard,
      this.typeCard]);

  @override
  _PopUpCardState createState() => _PopUpCardState();
}

class _PopUpCardState extends State<PopUpCard> {
  // Controlador da home
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    // Busca das infos passando o ID do filme
    homeController.detailsFilms(widget.imdbIDCard);

    // Construindo a tela
    return Observer(builder: (BuildContext context) {
      // Mostra a barra circular enquanto a busca é realizada
      if (homeController.details.value == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      // Pegando os valores da busca e guardando em datails
      var details = homeController.details.value;

      return Column(children: <Widget>[
        // Decoração do cabeçalho com nome e ano
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
                  child: Column(
                    children: <Widget>[
                      Text("${widget.titleCard}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                          )),
                      Text("${widget.yearCard}",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    ],
                  ))),
        ),
        // Corpo com o restante das infos (Diretor, Gênero, Nota IMDB e Resumo)
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Diretor: ${details.director}",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black87, fontSize: 15.0)),
                SizedBox(height: 10.0),
                Text("Gênero: ${details.genre}",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black87, fontSize: 15.0)),
                SizedBox(height: 10.0),
                Text("Nota IMDB: ${details.imdbRating}",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black87, fontSize: 15.0)),
                SizedBox(height: 10.0),
                Text("Resumo: ${details.plot}",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black87, fontSize: 15.0)),
              ],
            ),
          ),
        ),
      ]);
    });
  }
}
