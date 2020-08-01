import 'package:flutter/material.dart';

class Tutorial extends StatelessWidget {
  const Tutorial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
      child: Column(
        children: <Widget>[
          Text(
            'Digite algo nos campos de busca abaixo e então aperte',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.green,
            size: 48,
          ),
          Text(
            'para pesquisar por filmes na internet',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
