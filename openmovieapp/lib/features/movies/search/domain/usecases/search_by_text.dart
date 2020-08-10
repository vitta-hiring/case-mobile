import 'package:dartz/dartz.dart';
import 'package:openmovieapp/features/movies/search/domain/entities/search_result.dart';
import 'package:openmovieapp/features/movies/search/domain/erros/erros.dart';
import 'package:openmovieapp/features/movies/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<Failure,List<SearchResult>>> call(String searchTex);

}

class SearchByTextImpl implements SearchByText {
  final  SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<Failure, List<SearchResult>>> call(String searchTex) async {
    return repository.search(searchTex);
  }

}
