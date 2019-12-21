// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieModel on _MovieModel, Store {
  final _$isFavoriteAtom = Atom(name: '_MovieModel.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.context.enforceReadPolicy(_$isFavoriteAtom);
    _$isFavoriteAtom.reportObserved();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.context.conditionallyRunInAction(() {
      super.isFavorite = value;
      _$isFavoriteAtom.reportChanged();
    }, _$isFavoriteAtom, name: '${_$isFavoriteAtom.name}_set');
  }
}
