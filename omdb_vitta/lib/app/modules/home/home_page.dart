import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/components/ac_text_form_field.dart';
import 'components/home_header.dart';
import 'components/type_buttons.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Spacer(flex: 3),
              HomeHeader(),
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ACTextFormField(
                  enableFormField: false,
                  searchStore: controller.store.searchStore,
                  onTap: () => Modular.link.pushNamed("/detail"),
                  onChanged: (_) {},
                  autoFocus: false,
                ),
              ),
              TypeButtons(store: controller.store),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),

      
    );
  }
}
