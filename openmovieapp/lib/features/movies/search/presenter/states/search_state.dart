import 'package:openmovieapp/features/movies/search/domain/entities/search_result.dart';
import 'package:openmovieapp/features/movies/search/domain/erros/erros.dart';

abstract class SearchState {}

class StartState implements SearchState {
  const StartState();
}

class LoadingState implements SearchState {
  const LoadingState();
}

class ErrorState implements SearchState {
  final Failure error;
  const ErrorState( this.error);
}

class SuccessState implements SearchState {
  final List<SearchResult> list;
  const SuccessState(this.list);
}