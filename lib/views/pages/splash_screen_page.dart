import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/consts/consts_images.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.offNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          width: Get.width * 0.70,
          child: Image.asset(ConstsImages.logo),
        ),
      ),
    );
  }
}
