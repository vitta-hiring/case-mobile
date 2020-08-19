import 'package:flutter/material.dart';
import 'package:movies/components/vertical_items.dart';

class ListOfMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          VerticalItems(),
        ],
      ),
    );
  }
}
