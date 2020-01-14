import 'package:appfilmes/src/models/movie.dart';
import 'package:appfilmes/src/pages/HomePage/listadefilmes.dart';
import 'package:appfilmes/src/pages/MoviePage/moviepage.dart';
import 'package:appfilmes/src/services/ApiCalls.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = new List<Movie>();

  int qtdFilmes = 0;

  int pagesLoaded = 0;

  bool loading = false;

  bool erroSearch = false;

  String erroMsg = '';

  final textoBuscado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataBase de Filmes"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Qual filme você está buscando?',
                hasFloatingPlaceholder: false,
                prefixIcon: Icon(Icons.search),
                contentPadding: const EdgeInsets.only(bottom: 20),
                suffixIcon: IconButton(
                  onPressed: limpaCampo,
                  icon: Icon(Icons.clear),
                ),
              ),
              style: Theme.of(context).textTheme.title,
              controller: textoBuscado,
              onSubmitted: (_) {
                buscaFilme();
              },
            ),
            Expanded(
              child: erroSearch
                ? Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      erroMsg,
                      style:
                          TextStyle(color: Colors.redAccent, fontSize: 20),
                      textAlign: TextAlign.center,
                    )
                  )
                : ListaDeFilmes(
                    carregarMais: carregarMaisFilmes,
                    movies: movies,
                    qtdFilmes: qtdFilmes,
                    loading: loading,
                    abrirFilme: janelaFilme,
                  )
            ),
            (loading
              ? CircularProgressIndicator(
                  value: null,
                )
              : Container()
            )
          ],
        ),
        padding: const EdgeInsets.all(8.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buscaFilme();
          FocusScope.of(context).unfocus();
        },
        tooltip: 'Buscar',
        child: Icon(Icons.search),
      ),
    );
  }

  buscaFilme() async {
    setState(() {
      loading = true;
      movies = new List<Movie>();
      qtdFilmes = 0;
      pagesLoaded = 0;
    });
    try {
      var resposta = await ApiCalls.searchFilme(textoBuscado.text);
      setState(() {
        erroSearch = false;
        loading = false;
        movies = resposta.item1;
        qtdFilmes = resposta.item2;
        pagesLoaded = 1;
      });
    } catch (error) {
      errorHandle(error);
    }
  }

  carregarMaisFilmes() async {
    setState(() {
      loading = true;
    });
    try {
      pagesLoaded++;
      var resposta =
          await ApiCalls.searchFilme(textoBuscado.text, page: pagesLoaded);
      setState(() {
        erroSearch = false;
        loading = false;
        movies += resposta.item1;
      });
    } catch (error) {
      pagesLoaded--;
      errorHandle(error);
    }
  }

  void errorHandle(error) {
    var msgErro = 'Houve algum problema.';
    if (error == 'Movie not found!') {
      msgErro = 'Não há filmes com esse nome.';
    }
    if (textoBuscado.text == '') {
      msgErro = 'Você deve escrever algum nome antes de buscar.';
    }
    setState(() {
      loading = false;
      erroSearch = true;
      erroMsg = msgErro;
    });
  }

  void janelaFilme(Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return MoviePage(movie: movie);
        },
      ),
    );
  }

  void limpaCampo() {
    Future.delayed(Duration(milliseconds: 50)).then((_) {
      textoBuscado.clear();
    });
  }
}
