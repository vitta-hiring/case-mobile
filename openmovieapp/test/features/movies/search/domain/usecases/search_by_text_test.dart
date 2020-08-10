import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:openmovieapp/features/movies/search/domain/entities/search_result.dart';
import 'package:openmovieapp/features/movies/search/domain/repositories/search_repository.dart';
import 'package:openmovieapp/features/movies/search/domain/usecases/search_by_text.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final useCase = SearchByTextImpl(repository);

  test("Return list of ResultSearch", () async {
    when(repository.search(any)).thenAnswer((_) async => Right(<SearchResult>[]));
    final result = await useCase("rambo");
    expect(result | null, isA<List<SearchResult>>());
  });
}
