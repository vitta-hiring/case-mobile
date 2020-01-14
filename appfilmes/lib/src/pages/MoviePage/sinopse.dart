import 'package:flutter/material.dart';

class Sinopse extends StatelessWidget {

  final String plot;

  Sinopse({@required this.plot});

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey[200],
        child: Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.vertical(top: new Radius.circular(10)),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(top:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10,left: 10),
                child: Text(
                  'Sinopse',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  plot,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}