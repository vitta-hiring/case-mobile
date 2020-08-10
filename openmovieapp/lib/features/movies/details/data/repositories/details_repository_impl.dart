import 'package:dartz/dartz.dart';
import 'package:openmovieapp/features/movies/details/data/data_source/details_data_source.dart';
import 'package:openmovieapp/features/movies/details/domain/entities/details.dart';
import 'package:openmovieapp/features/movies/details/domain/erros/erros.dart';
import 'package:openmovieapp/features/movies/details/domain/repositories/details_repository.dart';

class DetailsRepositoryIpml implements DetailsRepository{
  final DetailsDataSource dataSource;

  DetailsRepositoryIpml(this.dataSource);

  @override
  Future<Either<Failure, Details>> get(String id) async {
   try {
     final result = await dataSource.getDetails(id);
     return Right(result);
   }catch(e){
     return Left(DataSourceError());
    }
  }
}