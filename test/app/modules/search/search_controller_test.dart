import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:movie_app/app/modules/search/search_controller.dart';
import 'package:movie_app/app/modules/search/search_module.dart';

void main() {
  initModule(SearchModule());
  SearchController search;

  setUp(() {
    search = SearchModule.to.bloc<SearchController>();
  });

  group('SearchController Test', () {
    test("First Test", () {
      expect(search, isInstanceOf<SearchController>());
    });

    test("Set Value", () {
      expect(search.value, equals(0));
      search.increment();
      expect(search.value, equals(1));
    });
  });
}
