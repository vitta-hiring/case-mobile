import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/app/services/api/omdb_api_service.dart';

void main() {
  OmdbApiService service;

  setUp(() {
    service = OmdbApiService();
  });

  group('OmdbApiService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<OmdbApiService>());
    });
  });
}
