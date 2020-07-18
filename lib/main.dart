import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/theme_light.dart';
import 'views/pages/home_page.dart';
import 'views/pages/movie_details_page.dart';
import 'views/pages/splash_screen_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: Get.put(ThemeLight().getTheme()),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          transition: Transition.leftToRight,
          transitionDuration: Duration(seconds: 1),
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/movie-details',
          page: () => MovieDetails(),
        ),
      ],
      home: SplashScreen(),
    );
  }
}
