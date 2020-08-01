import 'package:flutter/material.dart';
import 'package:movies/components/loading_indicator.dart';
import 'package:movies/components/outline_icon_button.dart';
import 'package:movies/components/tutorial.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class HomePageLayout extends StatelessWidget {
  Widget getMainContent(BuildContext context, MoviesProvider provider) {
    if (provider.homePageState == HomePageState.Initial) {
      return Tutorial();
    }
    if (provider.homePageState == HomePageState.Loading) {
      return LoadingIndicator();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Consumer<MoviesProvider>(
          builder: (context, provider, _) => getMainContent(context, provider),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.25,
          minChildSize: 0.25,
          maxChildSize: 0.6,
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
                    child: ListView(
                      controller: scrollController,
                      children: <Widget>[
                        Text(
                          'Aqui vem um formulário mais refinado',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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
                    callback: () => print('ok'),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
