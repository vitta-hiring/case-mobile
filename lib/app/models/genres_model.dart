import 'package:mobx/mobx.dart';


part 'genres_model.g.dart';

class GenresModel extends _GenresModel with _$GenresModel {
  GenresModel({
    String name
  }) : super(
            name: name);
  toJson() {
    return {
      "name": name
    };
  }

  factory GenresModel.fromJson(Map json) { 
    return GenresModel(
        name: json["name"]);
  }
}

abstract class _GenresModel with Store {
  String name;
 

  _GenresModel(
      {this.name
     });
}
