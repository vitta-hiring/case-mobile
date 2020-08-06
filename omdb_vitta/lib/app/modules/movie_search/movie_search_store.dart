import 'package:mobx/mobx.dart';

import '../../shared/models/movie_model.dart';
import '../../shared/stores/search_store.dart';

part 'movie_search_store.g.dart';

class MovieSearchStore = _MovieSearchStoreBase with _$MovieSearchStore;

abstract class _MovieSearchStoreBase with Store {
  final SearchStore searchStore;

  _MovieSearchStoreBase(this.searchStore);
  @observable
  bool enableSearch = true;
  @action
  toggleSearch() => enableSearch = !enableSearch;

  @observable
  ObservableList<MovieModel> moviesList = ObservableList<MovieModel>();

  @observable
  int currentPageIndex = 0;
  @action
  setCurrentPageIndex(int index) => currentPageIndex = index;

  @observable
  int maxSearchItems = 0;
  @action
  setMaxSearchItems(int newValue) => maxSearchItems = newValue;

  @computed
  bool get showRigthArrow => maxSearchItems == currentPageIndex && currentPageIndex != 0 ? true : false;

  @computed
  bool get showLeftArrow => currentPageIndex == 0 ? true : false;
}
