import 'package:dartz/dartz.dart';
import 'package:openmovieapp/features/movies/search/domain/entities/search_result.dart';
import 'package:openmovieapp/features/movies/search/domain/erros/erros.dart';

abstract class SearchRepository{
  Future<Either<Failure,List<SearchResult>>> search(String searchTex);
}
