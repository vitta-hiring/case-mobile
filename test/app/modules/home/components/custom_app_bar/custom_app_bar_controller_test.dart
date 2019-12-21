import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:movie_app/app/modules/home/components/custom_app_bar/custom_app_bar_controller.dart';
import 'package:movie_app/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  CustomAppBarController customappbar;

  setUp(() {
    customappbar = HomeModule.to.bloc<CustomAppBarController>();
  });

  group('CustomAppBarController Test', () {
    test("First Test", () {
      expect(customappbar, isInstanceOf<CustomAppBarController>());
    });

    test("Set Value", () {
      expect(customappbar.value, equals(0));
      customappbar.increment();
      expect(customappbar.value, equals(1));
    });
  });
}
