import 'package:VittaChallenge/common/theme/global_theme.dart';
import 'package:VittaChallenge/widgets/detail_film/detail_binding.dart';
import 'package:VittaChallenge/widgets/detail_film/detail_ui.dart';
import 'package:VittaChallenge/widgets/home/home_binding.dart';
import 'package:VittaChallenge/widgets/home/home_ui.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Vitta Challenge',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialBinding: HomeBinding(),
        defaultTransition: Transition.fade,
        home: HomeUI(),
      );
}
