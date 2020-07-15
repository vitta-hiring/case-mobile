import 'package:filme/app/modules/home/components/card_movies_widget.dart';
import 'package:filme/app/modules/home/components/form_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

// Tela principal do aplicativo, onde será construído o corpo do aplicativo

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  // homeController faz a chamada do controlador da Home
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Menu superior contendo ícone e título
        appBar: AppBar(
          title: Text("VittaFlix"),
          leading: IconButton(
            icon: Icon(Icons.movie),
            onPressed: () {},
          ),
          // decoração do menu
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.lightBlue, Colors.blueAccent])),
          ),
        ),
        backgroundColor: Colors.white,

        // Corpo do app
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        // Chamada da construção do formulário de pesquisa (form_home.dart)
                        child: FormHome(),
                      ),
                      Container(
                        // Parte dos cards listados
                        child: Observer(builder: (BuildContext context) {
                          // Caso a busca ainda não tenha retornado um resultado,
                          // a barra de progresso circular é mostrada
                          if (homeController.films.value == null) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          // Montagem da lista buscada
                          var list = homeController.films.value;
                          // Construção da view da lista
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: list.length,
                            itemBuilder: (BuildContext context, int index) {
                              // Caso não tenha erro, faz a chamada dos cards
                              // passando os parametros
                              if (list[index].error == null) {
                                return CardMovies(
                                    // Parametros passados para o CardMovie
                                    // Título, poster, ano (para montagem do card)
                                    // e ID para mostrar os detalhes do filme
                                    (list[index].title),
                                    (list[index].poster),
                                    (list[index].year),
                                    (list[index].imdbID));
                              } else
                              // Caso possua erro, alguma mensagem é retornada ao usuário
                              if (list[index].error != null) {
                                if (list[index].error ==
                                    "Something went wrong.") {
                                  return Center(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Icon(
                                        Icons.movie_filter,
                                        size: 50.0,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 17.0,
                                      ),
                                      Text(
                                        "1. Coloque o título",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17.0),
                                      ),
                                      Text(
                                        "2. Coloque o ano, se quiser",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17.0),
                                      ),
                                      Text(
                                        "3. Encontre seu filme!",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16.0),
                                      ),
                                    ],
                                  ));
                                } else if (list[index].error ==
                                    "Movie not found!") {
                                  return Center(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Icon(
                                        Icons.mood_bad,
                                        size: 50.0,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 17.0,
                                      ),
                                      Text(
                                        "Desculpe, não achamos seu filme...",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17.0),
                                      ),
                                      Text(
                                        "Mas não desista!",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17.0),
                                      ),
                                      Text(
                                        "Quem sabe com um ano...",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16.0),
                                      ),
                                    ],
                                  ));
                                }
                              }
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
