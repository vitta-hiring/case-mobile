import 'package:VittaChallenge/services/http/http_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Dio dio = Dio();

  HttpAdapter sut;
  setUp(() {
    sut = HttpAdapter(dio);
  });

  group('integration test method get from http adapter ', () {
    test('should receiver a response with film the Rambo', () async {
      final param = "&s=rambo&type=movie";
      final response = await sut.getApi(param);
      expect(response.toString(), contains('Rambo'));
    });
  });
}
