import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _widthSize = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            "Depois dos Créditos",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Container(width: _widthSize * 0.5, height: 2, color: Colors.white),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
          child: Text(
            "O app que te ajuda a descobrir todas as informações de seus filmes e séries favoritos!",
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
