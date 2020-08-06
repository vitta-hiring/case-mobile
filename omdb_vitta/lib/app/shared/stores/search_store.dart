import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  @observable
  String _searchType = "movie";
  @action
  setSearchType(String type) => _searchType = type;
  @computed
  String get searchType => _searchType;

  @observable
  String _searchData = "";
  @action
  inputSearchData(String data) => _searchData = data;
  @computed
  String get searchData => _searchData;
}
