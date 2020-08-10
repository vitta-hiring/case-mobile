import 'package:dartz/dartz.dart';
import 'package:openmovieapp/features/movies/details/domain/entities/details.dart';
import 'package:openmovieapp/features/movies/details/domain/erros/erros.dart';
import 'package:openmovieapp/features/movies/details/domain/repositories/details_repository.dart';

abstract class GetDetailsById {
  Future<Either<Failure, Details>> call(String id);
}

class GetDetailsByIdImpl implements GetDetailsById {
  final DetailsRepository repository;

  GetDetailsByIdImpl(this.repository);

  @override
  Future<Either<Failure, Details>> call(String id) {
    return repository.get(id);
  }
}
