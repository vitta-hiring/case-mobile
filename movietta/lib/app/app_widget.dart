import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  ThemeData themeData = ThemeData(
      primarySwatch: Colors.deepPurple, backgroundColor: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoVietta',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
