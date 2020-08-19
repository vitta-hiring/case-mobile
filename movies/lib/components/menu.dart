import 'package:flutter/material.dart';
import 'package:movies/components/section.dart';
import 'package:movies/components/vertical_items.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Section(
            sectionTitle: 'Lista de filmes',
          ),
        VerticalItems(),
      ],
    );
  }
}
