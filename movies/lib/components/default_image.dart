import 'package:flutter/material.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Center(
        child: Text(
          'Sem imagem',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
