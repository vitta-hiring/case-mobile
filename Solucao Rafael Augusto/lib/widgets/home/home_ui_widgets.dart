import 'package:VittaChallenge/share_components/input/input_placeholder.dart';
import 'package:VittaChallenge/widgets/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/gridview_films/gridview_films.dart';
import 'components/home_intro.dart';

Widget widgets(HomeController controller, Object onChange) => Column(
      children: <Widget>[
        Obx(() => controller.statusInput() == true
            ? SafeArea(
                minimum: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Input(
                  placeholder: 'Digite aqui o nome do filme',
                  onChange: onChange,
                  value: controller.getInputValue,
                ),
              )
            : Container()),
        Obx(
          () => controller.existFilms()
              ? GridViewFilms(
                  key: Key('gridview_films'), films: controller.getFilms)
              : HomeIntro(
                  key: Key(controller.existFilms() ? '' : 'homeintro'),
                ),
        )
      ],
    );
