import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/list_movie_controller.dart';
import 'package:test_app/core/consts/consts_colors.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final String filter;

  const ActionButton({Key key, this.text, this.filter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<ListMovieController>(
          init: ListMovieController(),
          builder: (controller) {
            return Container(
              width: Get.width * 0.30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: ConstsColors.blueLight,
                      blurRadius: 6,
                      offset: Offset(1, 1),
                    ),
                  ]),
              child: RaisedButton(
                color: ConstsColors.blueLight,
                onPressed: () {
                  controller.getSearchMovie(filter);
                },
                child: Text(
                  text,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            );
          }),
    );
  }
}
