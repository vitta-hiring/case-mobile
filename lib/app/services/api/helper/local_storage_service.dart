import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/app/models/movie_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalStorageService extends Disposable {
  Completer<Box> completer = Completer<Box>();

  LocalStorageService() {
    _initDB();
  }

  _initDB() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final box = await Hive.openBox("movieapp");
    if (!completer.isCompleted) completer.complete(box);
  }

  Future<List<MovieModel>> getAll() async {
    final box = await completer.future;
    return box.values.map((item) => MovieModel.fromJson(item)).toList();
  }

  Future<MovieModel> add(MovieModel model) async {
    final box = await completer.future;
    model.id = box.values.length;
    await box.put(box.values.length, model.toJson());
    return model;
  }

  Future<void> remove(int id) async {
    final box = await completer.future;
    await box.delete(id);
  }

  Future<void> clearAll() async {
    final box = await completer.future;
    await box.clear();
  }

  @override
  void dispose() async {
    final box = await completer.future;
    box.close();
  }
}
