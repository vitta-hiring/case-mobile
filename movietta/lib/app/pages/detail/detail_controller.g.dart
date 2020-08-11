// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailController on _DetailControllerBase, Store {
  final _$movieAtom = Atom(name: '_DetailControllerBase.movie');

  @override
  ObservableFuture<MovieModel> get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(ObservableFuture<MovieModel> value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  final _$_DetailControllerBaseActionController =
      ActionController(name: '_DetailControllerBase');

  @override
  dynamic getFullMovieData() {
    final _$actionInfo = _$_DetailControllerBaseActionController.startAction(
        name: '_DetailControllerBase.getFullMovieData');
    try {
      return super.getFullMovieData();
    } finally {
      _$_DetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movie: ${movie}
    ''';
  }
}
