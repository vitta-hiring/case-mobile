
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openmovieapp/features/movies/external/data_sources/open_movie_data_source.dart';

main() async {
  final Dio dio = Dio();

  final dataSource = OpenMovieDataSource(dio);
  test('Return list SearchResultModel', () async {
    expect(dataSource.getSearch('rambo'), completes);
  });
}