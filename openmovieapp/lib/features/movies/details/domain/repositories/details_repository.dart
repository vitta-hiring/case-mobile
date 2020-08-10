import 'package:dartz/dartz.dart';
import 'package:openmovieapp/features/movies/details/domain/entities/details.dart';
import 'package:openmovieapp/features/movies/details/domain/erros/erros.dart';

abstract class DetailsRepository{
  Future<Either<Failure,Details>> get(String id);
}
