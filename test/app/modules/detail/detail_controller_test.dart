import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:movie_app/app/modules/detail/detail_controller.dart';
import 'package:movie_app/app/modules/detail/detail_module.dart';

void main() {
  initModule(DetailModule());
  DetailController detail;

  setUp(() {
    detail = DetailModule.to.bloc<DetailController>();
  });

  group('DetailController Test', () {
    test("First Test", () {
      expect(detail, isInstanceOf<DetailController>());
    });

    test("Set Value", () {
      expect(detail.value, equals(0));
      detail.increment();
      expect(detail.value, equals(1));
    });
  });
}
