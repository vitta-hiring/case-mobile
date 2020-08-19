import 'package:flutter/material.dart';
import 'package:movies/components/menu.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/logo.png',
          height: 80,
          width: 80,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(child: Menu()),
    );
  }
}
