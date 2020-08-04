import 'package:flutter/material.dart';
import 'package:movies/components/loading_indicator.dart';
import 'package:movies/components/movies_list.dart';
import 'package:movies/components/outline_icon_button.dart';
import 'package:movies/components/search_form.dart';
import 'package:movies/components/error_card.dart';
import 'package:movies/components/tutorial.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class HomePageLayout extends StatelessWidget {
  Widget getMainContent(BuildContext context, MoviesProvider provider) {
    switch (provider.homePageState) {
      case HomePageState.Initial:
        return Tutorial();
        break;
      case HomePageState.Loading:
        return LoadingIndicator();
        break;
      case HomePageState.Result:
        return MoviesList(
          movies: provider.foundMovies,
        );
        break;
      default:
        return ErroCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context, provider, _) => Stack(
        children: <Widget>[
          getMainContent(context, provider),
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            minChildSize: 0.25,
            maxChildSize: 0.25,
            builder: (context, scrollController) {
              return Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: SearchForm(
                        scrollController: scrollController,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -40,
                    child: OutlineIconButton(
                      icon: Icons.search,
                      iconColor: Colors.green,
                      color: Colors.black,
                      borderColor: Colors.white,
                      size: 56,
                      callback: provider.searchMovies,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
