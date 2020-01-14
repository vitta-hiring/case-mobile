import 'package:appfilmes/src/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaDeFilmes extends StatelessWidget {

  ListaDeFilmes({@required this.carregarMais, @required this.movies , @required this.qtdFilmes , 
  @required this.loading, @required this.abrirFilme });

  final Function carregarMais;
  final List<Movie> movies;
  final int qtdFilmes;
  final bool loading;
  final Function abrirFilme;

  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent
        && movies.length < qtdFilmes && !loading) {
          carregarMais();
        }
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: (movies.length < qtdFilmes) ? movies.length + 1 : movies.length,
        itemBuilder: construirFilmes,
      ),
    );
  }

  Widget construirFilmes(context, int index) {
    return (index == movies.length ) ? 
      Container(
        color: Colors.greenAccent,
        child: FlatButton(
          child: Text("Load More"),
          onPressed: carregarMais,
        ),
      )
    : Card(
      child: ListTile(
        leading: posterThumbnail(movies[index].posterUrl),
        title: Text(movies[index].title),
        subtitle: Text(movies[index].year.toString()),
        onTap: () {abrirFilme(movies[index]);},
        trailing: Icon(Icons.chevron_right),
      )
    );
  }

  Widget posterThumbnail(url) {
    if(url=='N/A') {
      return Container(
        height: 100,
        width: 40,
        color: Colors.black,
        child: Center(
          child: Icon(
            Icons.local_movies,
            size: 30,
            color: Colors.grey,
          ),
        ),
      );
    }
    return Image(
      image: NetworkImage(url),
      fit: BoxFit.fill,
    );
  }
}