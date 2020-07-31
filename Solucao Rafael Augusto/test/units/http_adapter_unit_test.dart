import 'dart:convert';

import 'package:VittaChallenge/services/http/http_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  final Dio dio = Dio();
  DioAdapterMock mock;
  HttpAdapter sut;
  setUp(() {
    mock = DioAdapterMock();
    dio.httpClientAdapter = mock;
    sut = HttpAdapter(dio);
  });

  group('unit test method get from http adapter ', () {
    test('should receiver a response with list films', () async {
      final apiResp =
          ResponseBody.fromString(jsonEncode({'Search': 'list_films'}), 200);

      when(mock.fetch(any, any, any)).thenAnswer((_) async => apiResp);

      final resp = await sut.getApi('any_param');
      expect(resp, equals(jsonEncode({'Search': 'list_films'})));
    });
  });
}
