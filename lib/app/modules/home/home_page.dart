import 'package:flutter/material.dart';

import 'package:movie_app/app/models/movie_detail_model.dart';

import 'package:movie_app/app/modules/detail/detail_page.dart';
import 'package:movie_app/app/modules/favorite/favorite_page.dart';
import 'package:movie_app/app/modules/home/components/custom_app_bar/custom_app_bar_page.dart';
import 'package:movie_app/app/modules/home/components/top_popularity_tab/top_popularity_tab_page.dart';

import 'home_controller.dart';
import 'home_module.dart';
import 'package:movie_app/app/globals.dart' as globals;

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  final controller = HomeModule.to.bloc<HomeController>();
  final _pageController = PageController();
TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    globals.tabController = _tabController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {    
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        DefaultTabController(         
          length: 2,
          child: Scaffold(
            appBar: CustomAppBar(txtTab01: "Top Popularity",
              txtTab02: "Favoritos",tabController: _tabController ),
            body: TabBarView(
              controller: _tabController,
              children: [
                TopPopularityTabPage(),
                FavoritePage(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> goToDetails(int id) async {
    MovieDetailModel movieDetail = await controller.listMovie(id);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(model: movieDetail)),
    );
  }
}
