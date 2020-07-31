import 'package:VittaChallenge/share_components/load/load_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LoadSpinner extends StatelessWidget {
  final LoadController controller = Get.put(LoadController());

  Widget load(BuildContext context) => Container(
        color: Colors.transparent,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            padding: EdgeInsets.all(20),
            child: Loading(
              indicator: BallPulseIndicator(),
              size: 60.0,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Obx(
        () => controller.statusLoad ? load(context) : Container(),
      );
}
