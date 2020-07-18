import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'action_button.dart';

class ListViewActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.09,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ActionButton(
            text: "AÇÃO",
            filter: 'action',
          ),
          ActionButton(
            text: "AVENTURA",
            filter: 'adventure',
          ),
          ActionButton(
            text: "ROMANCE",
            filter: 'romance',
          ),
          ActionButton(
            text: "TERROR",
            filter: 'scary',
          ),
        ],
      ),
    );
  }
}
