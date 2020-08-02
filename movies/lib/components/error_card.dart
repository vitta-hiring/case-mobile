import 'package:flutter/material.dart';

class ErroCard extends StatelessWidget {
  const ErroCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.red[400],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Icon(
              Icons.error_outline,
              color: Colors.red[400],
              size: 32,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              'Ocorreu um erro ao realizar a pesquisa. Verifique sua conexão com a Internet ou refine mais sua busca.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.red[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
