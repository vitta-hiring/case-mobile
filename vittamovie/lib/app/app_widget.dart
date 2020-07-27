import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vittamovie/app/shared/utils/ColorConstants.dart';
import 'package:vittamovie/app/shared/utils/Constants.dart';
import 'package:vittamovie/app/shared/utils/TextContants.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: TextConstants.appName,
      theme: ColorConstants.darkTheme,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
