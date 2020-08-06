import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home_store.dart';

class TypeButtons extends StatefulWidget {
  final HomeStore store;

  const TypeButtons({
    Key key,
    this.store,
  }) : super(key: key);
  @override
  _TypeButtonsState createState() => _TypeButtonsState();
}

class _TypeButtonsState extends State<TypeButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Spacer(flex: 3),
        Observer(builder: (_) {
          return InkWell(
            onTap: widget.store.selectMovie,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 100,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: widget.store.isMovieSelected ? Border.all(color: Colors.white, width: 1.5) : null,
                color: Color(0xff5f0380),
              ),
              child: Center(
                child: Text(
                  "Filmes",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }),
        Spacer(flex: 1),
        Observer(builder: (_) {
          return InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: widget.store.selectSeries,
            child: Container(
              width: 100,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: widget.store.isSeriesSelected ? Border.all(color: Colors.white, width: 1.5) : null,
                color: Color(0xff5f0380),
              ),
              child: Center(
                child: Text(
                  "Séries",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }),
        Spacer(flex: 3),
      ],
    );
  }
}
