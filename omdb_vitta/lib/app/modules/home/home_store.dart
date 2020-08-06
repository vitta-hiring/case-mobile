import 'package:mobx/mobx.dart';

import '../../shared/stores/search_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final SearchStore searchStore;
  _HomeStoreBase(this.searchStore);

  @observable
  bool _movieSelected = true;

  @computed
  bool get isMovieSelected => _movieSelected;
  @action
  selectMovie() => toggleSelection(movieType: true);

  @observable
  bool _seriesSelected = false;
  @computed
  bool get isSeriesSelected => _seriesSelected;
  @action
  selectSeries() => toggleSelection(seriesType: true);

  @computed
  String get selectedType =>
      isSeriesSelected ? searchStore.setSearchType("series") : searchStore.setSearchType("movie");

  @action
  toggleSelection({bool movieType = false, bool seriesType = false}) {
    if (isSeriesSelected && movieType && !seriesType) {
      _movieSelected = true;
      _seriesSelected = false;
      searchStore.setSearchType("movie");
      print(searchStore.searchType);
    } else if (isMovieSelected && seriesType && !movieType) {
      _movieSelected = false;
      _seriesSelected = true;
      searchStore.setSearchType("series");
      print(searchStore.searchType);
    }
  }
}
