import 'package:openmovieapp/features/movies/details/domain/entities/details.dart';
import 'package:openmovieapp/features/movies/details/domain/erros/erros.dart';

abstract class DetailsState {}

class StartState implements DetailsState {
  const StartState();
}

class LoadingState implements DetailsState {
  const LoadingState();
}

class ErrorState implements DetailsState {
  final Failure error;
  const ErrorState( this.error);
}

class SuccessState implements DetailsState {
  final Details details;
  const SuccessState(this.details);
}