import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

import '../../shared/components/ac_text_form_field.dart';
import '../../shared/components/after_credits_dialog/after_credits_dialog.dart';
import '../../shared/components/manual_page_control.dart';
import 'components/movie_info_dialog.dart';
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
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "👆👆",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\n\nDigite o nome ${searchType == "movie" ? "do filme" : "da série"} ali em cima!',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ((controller.store.moviesList == null || controller.store.moviesList.isEmpty))
                            ? Container(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "😭",
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n\nNenhum título encontrado, tente outro!',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                child: Stack(
                                  children: <Widget>[
                                    Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: CachedNetworkImageProvider(moviesList[selectedIndex].poster),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Container(color: Color(0xaa000000)),
                                      ],
                                    ),
                                    ManualPageControl(
                                      height: _widthSize * 1.5,
                                      controller: controller.carouselController,
                                      hasTitles: true,
                                      onTapMovie: () async {
                                        await controller.doSearchMovieById(id: controller.store.movieOnScreen.imdbId);
                                        return AfterCreditsDialog.showMovieInfo(
                                          child: Center(
                                            child: MovieInfoDialog(
                                              selectedMovie: controller.store.selectedMovie,
                                            ),
                                          ),
                                        );
                                      },
                                      onPageChanged: (index, _) {
                                        print("INDEX ATUAL: $index");
                                        controller.store.setCurrentPageIndex(index);
                                        controller.store.setMovieOnScreen(moviesList[index]);
                                        if (moviesList.length > 9 && (index == moviesList.length - 3)) {
                                          controller.nextMoviesPage();
                                        }
                                      },
                                      titles: moviesList.asMap().entries.map((e) {
                                        return Container(
                                          width: _widthSize * 0.5,
                                          // height: _widthSize * 0.1,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.white, width: 2),
                                              borderRadius: BorderRadius.circular(5)),
                                          child: Center(
                                            child: Text(
                                              e.value.title,
                                              style: GoogleFonts.pangolin(
                                                color: Colors.purple,
                                                fontSize: 20,
                                              ),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      items: moviesList.asMap().entries.map((e) {
                                        return CachedNetworkImage(
                                          imageUrl: e.value.poster,
                                          imageBuilder: (context, provider) {
                                            return InkWell(
                                              onTap: () async {
                                                await controller.doSearchMovieById(
                                                    id: controller.store.movieOnScreen.imdbId);
                                                return AfterCreditsDialog.showMovieInfo(
                                                  child: MovieInfoDialog(
                                                    selectedMovie: controller.store.selectedMovie,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: _widthSize * 1,
                                                // width: _widthSize * 0.56,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: 4, color: Colors.white),
                                                ),
                                                child: Image(image: provider, fit: BoxFit.fitHeight),
                                              ),
                                            );
                                          },
                                          errorWidget: (context, url, error) {
                                            return InkWell(
                                              onTap: () async {
                                                await controller.doSearchMovieById(
                                                    id: controller.store.movieOnScreen.imdbId);
                                                return AfterCreditsDialog.showMovieInfo(
                                                  child: MovieInfoDialog(
                                                    selectedMovie: controller.store.selectedMovie,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                  height: _widthSize * 1.0,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 4, color: Colors.white),
                                                  ),
                                                  child: Image.asset("assets/empty_movie.png")),
                                            );
                                          },
                                        );
                                      }).toList(),
                                    ),
                                    controller.store.showRigthArrow
                                        ? SizedBox()
                                        : Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: InkResponse(
                                                onTap: () => controller.carouselController.nextPage(
                                                  duration: Duration(milliseconds: 300),
                                                  curve: Curves.linear,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(0xcc5f0380),
                                                      ),
                                                      child: Icon(Icons.arrow_right, size: 40),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                    controller.store.showLeftArrow
                                        ? SizedBox()
                                        : Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: InkResponse(
                                                onTap: () => controller.carouselController.previousPage(
                                                  duration: Duration(milliseconds: 300),
                                                  curve: Curves.linear,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(0xcc5f0380),
                                                      ),
                                                      child: Icon(Icons.arrow_left, size: 40),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
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
