import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'search_controller.g.dart';

class SearchController = _SearchBase with _$SearchController;

abstract class _SearchBase with Store {
  @observable
  int value = 0;

  @action
  Future<List> suggestions(String search) async {
    http.Response response = await http.get(
        "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json");

    if (response.statusCode == 200) {
      return json.decode(response.body)[1].map((v) {
        return v[0];
      }).toList();
    } else {
      throw Exception("Failed to load suggestions");
    }
  }
}
