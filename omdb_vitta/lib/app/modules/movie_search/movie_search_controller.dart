import 'package:bot_toast/bot_toast.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'models/movie_search_response_model.dart';
import 'movie_search_repository.dart';
import 'movie_search_store.dart';

part 'movie_search_controller.g.dart';

class MovieSearchController = _MovieSearchControllerBase with _$MovieSearchController;

abstract class _MovieSearchControllerBase extends Disposable with Store {
  final MovieSearchRepository repository;
  final MovieSearchStore store;
  ReactionDisposer _disposer;

  CarouselController carouselController = CarouselController();

  _MovieSearchControllerBase(this.repository, this.store) {
    _disposer = reaction((_) => store.searchStore.searchData, (data) {
      if (data.length >= 3) {
        doSearchMovie(data);
      }
    });
  }

  @observable
  ObservableFuture<MovieSearchResponseModel> moviesListResponse = ObservableFuture.value(null);

  int page = 1;
  int totalPages = 1;

  @action
  nextMoviesPage() {
    if (page <= totalPages) {
      page++;
    }
    doSearchMovie(store.searchStore.searchData, nextPage: true);
    print("PÁGINA ATUAL: $page");
  }

  @action
  doSearchMovie(String movieName, {bool nextPage = false}) async {
    var cancel = BotToast.showLoading();
    try {
      moviesListResponse = repository
          .searchMovie(
            movieName: movieName,
            type: store.searchStore.searchType,
            page: nextPage ? page : 1,
          )
          .asObservable();

      await moviesListResponse;
      if (moviesListResponse.value != null) {
        var maxPages = store.maxSearchItems ~/ 10;
        if ((maxPages * 10) < store.maxSearchItems) {
          maxPages = maxPages + 1;
        }
        totalPages = maxPages;

        print("TOTAL DE PÁGINAS: ${totalPages}");

        if (nextPage && page <= totalPages) {
          store.moviesList.addAll(moviesListResponse?.value?.moviesList?.asObservable());
          print("PÁGINA ATUAL: ${page}");
        } else if (!nextPage) {
          store.setCurrentPageIndex(0);
          carouselController.animateToPage(0);
          store.moviesList = moviesListResponse?.value?.moviesList?.asObservable();
          store.setMaxSearchItems(moviesListResponse?.value?.totalResults ?? 0);
        }

        print(store.moviesList?.first);
      }
      cancel();
    } on DioError catch (e) {
      print(e);
      cancel();
    }
  }

  @override
  void dispose() {
    store.searchStore.inputSearchData("");
    _disposer();
  }
}
