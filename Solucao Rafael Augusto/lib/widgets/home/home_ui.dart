import 'package:VittaChallenge/share_components/custom_scaffold/custom_scaffold.dart';
import 'package:VittaChallenge/widgets/home/home_ui_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeUI extends GetView<HomeController> {
  handleInput(e) => Get.find<HomeController>().searchFilm(e.toString());
  onClickActinButton() => Get.find<HomeController>().showInput();
  @override
  Widget build(BuildContext context) => CustomScaffold(
        title: "",
        iconClose: true,
        floatButton: true,
        onClick: onClickActinButton,
        children: widgets(controller, handleInput),
      );
}
