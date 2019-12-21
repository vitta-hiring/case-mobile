// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$listAtom = Atom(name: '_HomeBase.list');

  @override
  ObservableList<MovieModel> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList<MovieModel> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$txtTab01Atom = Atom(name: '_HomeBase.txtTab01');

  @override
  String get txtTab01 {
    _$txtTab01Atom.context.enforceReadPolicy(_$txtTab01Atom);
    _$txtTab01Atom.reportObserved();
    return super.txtTab01;
  }

  @override
  set txtTab01(String value) {
    _$txtTab01Atom.context.conditionallyRunInAction(() {
      super.txtTab01 = value;
      _$txtTab01Atom.reportChanged();
    }, _$txtTab01Atom, name: '${_$txtTab01Atom.name}_set');
  }

  final _$txtTab02Atom = Atom(name: '_HomeBase.txtTab02');

  @override
  String get txtTab02 {
    _$txtTab02Atom.context.enforceReadPolicy(_$txtTab02Atom);
    _$txtTab02Atom.reportObserved();
    return super.txtTab02;
  }

  @override
  set txtTab02(String value) {
    _$txtTab02Atom.context.conditionallyRunInAction(() {
      super.txtTab02 = value;
      _$txtTab02Atom.reportChanged();
    }, _$txtTab02Atom, name: '${_$txtTab02Atom.name}_set');
  }

  final _$searchVideosAsyncAction = AsyncAction('searchVideos');

  @override
  Future searchVideos(String search) {
    return _$searchVideosAsyncAction.run(() => super.searchVideos(search));
  }
}
