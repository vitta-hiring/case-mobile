import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/components/ac_text_form_field.dart';
import '../../shared/components/after_credits_dialog/after_credits_dialog.dart';
import '../../shared/components/manual_page_control.dart';
import 'components/caroussel_components/caroussel_item.dart';
import 'components/caroussel_components/caroussel_item_title.dart';
import 'components/caroussel_components/page_controllers/next_page_arrow.dart';
import 'components/caroussel_components/page_controllers/previous_page_arrow.dart';
import 'components/image_background_widget.dart';
import 'components/movie_info_dialog.dart';
import 'components/no_title_found_widget.dart';
import 'components/write_text_hint_widget.dart';
import 'movie_search_controller.dart';

class MovieSearchPage extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends ModularState<MovieSearchPage, MovieSearchController> {
  @override
  Widget build(BuildContext context) {
    double _widthSize = MediaQuery.of(context).size.width;
    var searchType = controller.store.searchStore.searchType;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(searchType == "movie" ? "Filmes" : "Séries"),
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ACTextFormField(
              enableFormField: true,
              onTap: () {},
              searchStore: controller.store.searchStore,
              onChanged: controller.store.searchStore.inputSearchData,
              autoFocus: true,
            ),
          ),
          preferredSize: Size.fromHeight(50.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                height: _widthSize * 1.5,
                child: Center(
                  child: Observer(builder: (_) {
                    var moviesList = controller.store.moviesList;
                    var selectedIndex = controller.store.currentPageIndex;
                    return controller.store.searchStore.searchData.isEmpty
                        ? WriteTextHintWidget(searchType: searchType)
                        : ((moviesList == null || moviesList.isEmpty))
                            ? NoTitleFoundWidget()
                            : Stack(
                                children: <Widget>[
                                  ImageBackgroundWidget(urlImage: moviesList[selectedIndex].poster),
                                  ManualPageControl(
                                    height: _widthSize * 1.5,
                                    controller: controller.carouselController,
                                    hasTitles: true,
                                    onTapMovie: () async {
                                      await controller.doSearchMovieById(id: controller.store.movieOnScreen.imdbId);
                                      return AfterCreditsDialog.showMovieInfo(
                                        child: Center(
                                          child: MovieInfoDialog(selectedMovie: controller.store.selectedMovie),
                                        ),
                                      );
                                    },
                                    onPageChanged: (index, _) {
                                      controller.store.setCurrentPageIndex(index);
                                      controller.store.setMovieOnScreen(moviesList[index]);

                                      if (moviesList.length > 9 && (index == moviesList.length - 3)) {
                                        controller.nextMoviesPage();
                                      }
                                    },
                                    titles: moviesList.asMap().entries.map((e) {
                                      return CarousselItemTitle(
                                        item: e.value,
                                        widthTitleText: _widthSize * 0.5,
                                      );
                                    }).toList(),
                                    items: moviesList.asMap().entries.map((e) {
                                      return CarousselItem(
                                        controller: controller,
                                        item: e.value,
                                        itemHeight: _widthSize,
                                      );
                                    }).toList(),
                                  ),
                                  controller.store.showRigthArrow
                                      ? NextPageArrowWidget(
                                          onTap: () => controller.carouselController.nextPage(
                                            duration: Duration(milliseconds: 300),
                                            curve: Curves.linear,
                                          ),
                                        )
                                      : SizedBox(),
                                  controller.store.showLeftArrow
                                      ? PreviousPageArrowWidget(
                                          onTap: () => controller.carouselController.previousPage(
                                            duration: Duration(milliseconds: 300),
                                            curve: Curves.linear,
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
