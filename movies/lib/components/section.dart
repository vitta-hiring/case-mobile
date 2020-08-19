import 'package:flutter/material.dart';

class Section extends StatelessWidget {

  final String sectionTitle;

  const Section({Key key, this.sectionTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              sectionTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FlatButton(
              onPressed: null,
              child: Text('Ver todos'),
            )
          ],
        ),
      ),
    );
  }
}
