import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:movie_app/app/app_controller.dart';
import 'package:movie_app/app/app_module.dart';

void main() {
  Modular.init(AppModule());
  bindModule(AppModule());
  AppController app;

  setUp(() {
    app = AppModule.to.bloc<AppController>();
  });

  group('AppController Test', () {
    test("First Test", () {
      expect(app, isInstanceOf<AppController>());
    });

    test("Set Value", () {
      expect(app.value, equals(0));
      app.increment();
      expect(app.value, equals(1));
    });
  });
}
