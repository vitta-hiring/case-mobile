import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/components/ac_text_form_field.dart';
import '../../shared/components/manual_page_control.dart';
import 'movie_search_controller.dart';

class MovieSearchPage extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends ModularState<MovieSearchPage, MovieSearchController> {
  @override
  Widget build(BuildContext context) {
    double _widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(controller.store.searchStore.searchType == "movie" ? "Filmes" : "Séries"),
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
          child: Column(
            children: <Widget>[
              Container(
                height: _widthSize * 1.1,
                child: Center(
                  child: Observer(builder: (_) {
                    return (controller.store.moviesList == null || controller.store.moviesList.isEmpty)
                        ? Container(color: Colors.red, child: Text("Tente digitar o nome do filme ali em cima"))
                        : Container(
                            // color: Colors.red,
                            child: Stack(
                              children: <Widget>[
                                ManualPageControl(
                                  controller: controller.carouselController,
                                  onPageChanged: (index, _) {
                                    var length = controller.store.moviesList.length;
                                    print("INDEX ATUAL: $index");
                                    controller.store.setCurrentPageIndex(index);
                                    if (length > 9 && (index == length - 3)) {
                                      controller.nextMoviesPage();
                                    }
                                  },
                                  titles: controller.store.moviesList.asMap().entries.map((e) {
                                    return Container(
                                      width: _widthSize * 0.5,
                                      // color: Colors.purple,
                                      child: Center(
                                        child: Text(
                                          e.value.title,
                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  items: controller.store.moviesList.asMap().entries.map((e) {
                                    return CachedNetworkImage(
                                      imageUrl: e.value.poster,
                                      imageBuilder: (context, provider) {
                                        return Container(
                                          height: _widthSize * 0.9,
                                          child: Image(
                                            image: provider,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return Container();
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
                                                    color: Colors.green,
                                                  ),
                                                  child: Icon(
                                                    Icons.arrow_right,
                                                    size: 40,
                                                  ),
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
                                                    color: Colors.green,
                                                  ),
                                                  child: Icon(
                                                    Icons.arrow_left,
                                                    size: 40,
                                                  ),
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
              (controller.store.moviesList == null || controller.store.moviesList.isEmpty)
                  ? SizedBox()
                  : Container(
                      height: _widthSize * 0.8,
                      // color: Colors.yellow,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
