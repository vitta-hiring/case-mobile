import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:openmovieapp/features/movies/search/data/data_source/search_data_source.dart';
import 'package:openmovieapp/features/movies/search/data/models/search_result_model.dart';
import 'package:openmovieapp/features/movies/search/data/repositories/search_repository_impl.dart';

class SearchDataSourceMock extends Mock implements SearchDataSource {}

main() {
  final dataSource = SearchDataSourceMock();
  final repository = SearchRepositoryIpml(dataSource);

  test('Return list result Search', () async {
    when(dataSource.getSearch(any))
        .thenAnswer((_) async => <SearchResultModel>[]);
    final result = await repository.search('rambo');
    expect(result | null, isA<List<SearchResultModel>>());
  });
}
