import 'package:flutter/material.dart';
import 'package:movie_app/app/delegates/search/search_page.dart';
import 'package:movie_app/app/modules/home/components/custom_tab_bar/custom_tab_bar_page.dart';
import 'package:movie_app/app/modules/home/components/top_popularity_tab/top_popularity_tab_page.dart';
import 'package:movie_app/app/modules/home/home_controller.dart';
import 'package:movie_app/app/modules/home/home_module.dart';
import 'package:movie_app/app/services/api/helper/hex_colors.dart';
import 'package:movie_app/app/globals.dart' as globals;

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  //final Size preferredSize; // default is 56.0
  final TabController tabController;
  final String txtTab01;
  final String txtTab02;  
  

  const CustomAppBar({Key key, this.txtTab01, this.txtTab02, this.tabController}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final controller = HomeModule.to.bloc<HomeController>();

  String get txtTab01 => txtTab01;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: CustomTabBar(HexColor("081c24"), "Top Populares", "Favoritos",globals.tabController),
      title: Container(
          height: 45,
          child: Image.asset("assets/images/tmdb_logo_blue.png"),
        ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () async {
            String resultSearch =
                await showSearch(context: context, delegate: SearchPage());
            if (resultSearch != null) {
              globals.tabController.animateTo(0);                          
              controller.searchVideos(resultSearch);
            }
          },
        )
      ],
    );
  }
}
