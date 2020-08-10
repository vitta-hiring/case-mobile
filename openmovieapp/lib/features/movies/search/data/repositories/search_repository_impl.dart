import 'package:dartz/dartz.dart';
import 'package:openmovieapp/features/movies/search/data/data_source/search_data_source.dart';
import 'package:openmovieapp/features/movies/search/domain/entities/search_result.dart';
import 'package:openmovieapp/features/movies/search/domain/erros/erros.dart';
import 'package:openmovieapp/features/movies/search/domain/repositories/search_repository.dart';

class SearchRepositoryIpml implements SearchRepository{
  final SearchDataSource dataSource;

  SearchRepositoryIpml(this.dataSource);

  @override
  Future<Either<Failure, List<SearchResult>>> search(String searchTex) async {
   try {
     final result = await dataSource.getSearch(searchTex);
     return Right(result);
   }catch(e){
     return Left(DataSourceError());
    }
  }
}