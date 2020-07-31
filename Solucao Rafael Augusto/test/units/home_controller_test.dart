import 'package:VittaChallenge/services/http/http_adapter.dart';
import 'package:VittaChallenge/share_components/load/load_controller.dart';
import 'package:VittaChallenge/widgets/home/home_controller.dart';
import 'package:VittaChallenge/widgets/home/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_home_repository.dart';

void main() {
  HttpAdapter http;
  IHomeRepository repository;
  HomeController sut;
  LoadController load;

  setUp(() {
    final dio = Dio();
    http = HttpAdapter(dio);
    repository = MockHomeRepository(http);
    load = LoadController();
    sut = Get.put(HomeController(repository, load));
  });

  group('test home controller', () {
    test('should return value input text', () {
      String titleFilm = 'any_film';
      Get.find<HomeController>().searchFilm(titleFilm);

      expect(sut.getInputValue, equals(titleFilm));
    });

    test('should return list films', () async {
      String titleFilm = 'rambo';
      await Get.find<HomeController>().searchFilm(titleFilm);
      await Future.delayed(const Duration(milliseconds: 800), () {});
      expect(sut.getFilms.length, equals(1));
    });

    test('should return EMPTY list films', () async {
      String titleFilm = 'empty_input_or_film_not_found';
      await Get.find<HomeController>().searchFilm(titleFilm);

      expect(sut.getFilms.length, equals(0));
    });
  });
}
