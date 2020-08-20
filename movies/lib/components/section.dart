import 'package:flutter/material.dart';

class Section extends StatelessWidget {

  final String sectionTitle;
  final bool loading;

  const Section({Key key, this.sectionTitle, this.loading}) : super(key: key);

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
             loading ? Text('') : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
